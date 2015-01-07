@ECHO OFF
powershell -ExecutionPolicy ByPass -File %~dp0\pullobject.ps1 %*
