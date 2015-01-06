@ECHO OFF
sqlps -ExecutionPolicy ByPass -File %~dp0\pushview.ps1 %*
