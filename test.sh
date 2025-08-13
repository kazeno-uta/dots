#!/bin/bash
AGE=$1

if [ $AGE -gt 0 ]&&[ $2 = "-" ] || [ $AGE -lt 100 ]&&[ $2 = "+" ]; then
    echo "ok"
fi