#!/bin/bash

############################
# Installs repository tools
############################

## Tools list
tools=("
       os
       ")

## Install dependencies
for i in $tools
do
         echo "Installing package '$i'."
         pip3 install $i
done
