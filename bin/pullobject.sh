#!/bin/sh
dir=$(dirname $0)
script="/pullobject.ps1"

file=$dir$script
powershell -ExecutionPolicy ByPass -File $file $@
