#!/bin/sh
dir=$(dirname $0)
script="/pushobject.ps1"

file=$dir$script
sqlps -ExecutionPolicy ByPass -File $file $@
