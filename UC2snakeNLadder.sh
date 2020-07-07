#!/bin/bash

echo "Welcome to snake and ladder"

readonly startPosition=0

currentPosition=startPosition

dieRoll=$((RANDOM%6+1))

echo $dieRoll
