#!/bin/bash

#Range
for i in $(seq 1 5)
do
    echo "Hello, World! This is iteration $i"
done

#Negative range
for i in $(seq 5 -1 1)
do
    echo "Hello, World! This is iteration $i"
done

