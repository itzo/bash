#!/bin/bash

# Fix executable bit on all files recursively according to output of `file` cmd

# bash -c '...' none {} causes a bash shell to run the command in the quotes
# with the file name in {} assigned to positional argument $1. none is $0.

find . -type f -exec bash -c 'if file -b "$1" | grep -q executable; then chmod +x "$1"; else chmod -x "$1"; fi' None {} \;
