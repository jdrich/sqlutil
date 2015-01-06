@ECHO OFF
powershell -ExecutionPolicy ByPass -File %~dp0\pullview.ps1 %*
