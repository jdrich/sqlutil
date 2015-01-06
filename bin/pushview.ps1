##
# This command needs to be run with sqlps and not powershell. When we upgrade
# to SQL Server 2012, the script will have to be modified to import the sqlps
# module.
#
# The command itself can be used to execute arbitrary scripts, so be careful.
##
param(
    [string]$server="SQL-DEV",
    [Parameter(Mandatory=$TRUE)][string]$view
)

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
        Write-Host "View at" $view "was NOT successfully written."
        Write-Host "Error:"

        throw $exception
    } else {
        Write-Host "View at" $view "successfully written."
    }
}
