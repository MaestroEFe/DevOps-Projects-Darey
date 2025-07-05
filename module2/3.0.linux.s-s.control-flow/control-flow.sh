#!/bin/bash

# Ask for a number
read -p "Enter a number: " num

# Print the number
echo "you have entered the number" $num

# Check if the number is positive, negative, or zero
if [ $num -gt 0 ]; then
    echo "The number is positive."
elif [ $num -lt 0 ]; then
    echo "The number is negative."
else
    echo "The number is zero."
fi
