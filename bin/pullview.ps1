param(
    [string]$server="SQL-DEV",
    [string]$database="ares",
    [string]$path=".",
    [Parameter(Mandatory=$TRUE)][string]$view
)

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
