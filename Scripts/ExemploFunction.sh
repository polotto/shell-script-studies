#!/bin/bash

maiuscula () {
local VAR1=$(echo $1 | tr a-z A-Z)
}

maiuscula script
echo $VAR1
