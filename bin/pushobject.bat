@ECHO OFF
sqlps -ExecutionPolicy ByPass -File %~dp0\pushobject.ps1 %*
