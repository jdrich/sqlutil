##
# This command needs to be run with sqlps and not powershell. When we upgrade
# to SQL Server 2012, the script will have to be modified to import the sqlps
# module.
#
# The command itself can be used to execute arbitrary scripts, so be careful.
##
param(
    [string]$server,
    [Parameter(Mandatory=$TRUE)][string]$view
)

# Look for configuration files if configuration was not passed.
if(($server -eq "")) {
    [System.Reflection.Assembly]::LoadWithPartialName("System.Web.Extensions")

    $json = New-Object System.Web.Script.Serialization.JavaScriptSerializer
    $invocation = (Get-Variable MyInvocation).Value.MyCommand

    $location = (Get-Location -psProvider FileSystem).Path
    $script_location = Split-Path -parent (Split-Path -parent $invocation.Path)
    $config_file = "\config.json";

    if (Test-Path ("FileSystem::" + $location + $config_file)) {
        $data = Get-Content ($location + $config_file) | Out-String

        $config = $json.DeserializeObject($data)
    } elseif(Test-Path ("FileSystem::" + $script_location + $config_file)) {
        $data = Get-Content ($script_location + $config_file) | Out-String

        $config = $json.DeserializeObject($data)
    } else {
        throw [System.IO.FileNotFoundException] "Missing configuration options and no config files found."
    }

    $server = $config.server
}

$view_file = "FileSystem::" + $view

if (-not (Test-Path $view_file)) {
    Write-Host "Specified view file does not exist."
} else {
    $failure = $FALSE

    Try {
        Invoke-Sqlcmd -ErrorAction Stop -OutputSqlErrors $true -ServerInstance $server -InputFile $view
    } Catch [System.Exception] {
        $failure = $TRUE

        $exception = $_
    }

    if($failure) {
        Write-Host "View at" $view "was NOT successfully written to database."
        Write-Host "Error:"

        throw $exception
    } else {
        Write-Host "View at" $view "successfully written to database."
    }
}
