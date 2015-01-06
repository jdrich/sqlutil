#!/bin/sh
dir=$(dirname $0)
script="/pushview.ps1"

file=$dir$script
sqlps -ExecutionPolicy ByPass -File $file $@
