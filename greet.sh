#!/bin/bash
name=$1
if [ "$name" == "" ]; then
  echo "No name given"
  exit 1
fi
echo "Hello $name"
