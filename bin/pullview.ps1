param(
    [string]$server,
    [string]$database,
    [string]$path,
    [Parameter(Mandatory=$TRUE)][string]$view
)

# Look for configuration files if configuration was not passed.
if(($server -eq "") -or($database -eq "") -or ($path -eq "")) {
    [System.Reflection.Assembly]::LoadWithPartialName("System.Web.Extensions")

    $json = New-Object System.Web.Script.Serialization.JavaScriptSerializer
    $invocation = (Get-Variable MyInvocation).Value.MyCommand

    $location = (Get-Location).Path
    $script_location = Split-Path -parent (Split-Path -parent $invocation.Path)
    $config_file = "\config.json";


    if (Test-Path ($location + $config_file)) {
        $data = Get-Content ($location + $config_file) | Out-String

        $config = $json.DeserializeObject($data)
    } elseif(Test-Path ($script_location + $config_file)) {
        $data = Get-Content ($script_location + $config_file) | Out-String

        $config = $json.DeserializeObject($data)
    } else {
        throw [System.IO.FileNotFoundException] "Missing configuration options and no config files found."
    }

    $server = $config.server
    $database = $config.database
    $path = $config.path
}

$schema = "dbo"
$views_path = "$path\views\"

[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.SMO") | out-null

$srv = New-Object "Microsoft.SqlServer.Management.SMO.Server" $server
$scripter = New-Object "Microsoft.SqlServer.Management.SMO.Scripter" $server
$objects = $srv.Databases.item($database).Views | Where-object { $_.schema -eq $schema }


if (-not (Test-Path $views_path)) {
    [System.IO.Directory]::CreateDirectory($views_path)
}

if($view -ne "view-all") {
    $objects = $objects | Where-object { $_.Name -eq $view }
}

foreach($object in $objects) {
    if ($object -ne $null) {
        $scripter.Options.IncludeHeaders  = $TRUE
        $scripter.Options.IncludeDatabaseContext = $TRUE
        $scripter.Options.IncludeIfNotExists = $TRUE

        $scripter.Options.ScriptSchema = $TRUE
        $scripter.Options.ScriptData = $FALSE
        $scripter.Options.ScriptDrops = $TRUE

        $scripter.Options.ToFileOnly = $TRUE
        $scripter.Options.AnsiFile = $TRUE

        $scripter.Options.FileName = $views_path + $object.Name + ".sql"

        $scripter.Script($object)

        $scripter.Options.IncludeIfNotExists = $FALSE
        $scripter.Options.ScriptDrops = $FALSE
        $scripter.Options.AppendToFile = $TRUE
        $scripter.Options.ExtendedProperties = $TRUE

        $scripter.Script($object)

        Write-Host "Successfully wrote" $scripter.Options.FileName
    } else {
        Write-Host "Requested view not found."
    }
}
