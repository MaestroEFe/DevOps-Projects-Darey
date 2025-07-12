#!/bin/bash

for ((i=0; i<5; i++)); do
    echo "Hello, World! This is iteration $i"
done

#Negative range
for ((i=5; i>0; i--)); do
    echo "Hello, World! This is iteration $i"
done