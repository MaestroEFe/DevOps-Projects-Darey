#!/bin/bash

# echo "Hello, World!"

# greet() {
#     name1=$1
#     name2=$2

#     echo "hello, $name1 $name2"

#     test="hello, $name1"

#     echo "This is the value of Test: $test"
# }

# greet "John" "Alice Bob" "Joe"

# result=$(greet Alice Bob)

# echo $result



# ARRAYS
echo ARRAYS
echo ==========

fruits=("apple" "banana" "cherry")

#Adding Elements

fruits[3]="date"
fruits+=("elderdate")

# Accessing Arrays

echo "First fruit: ${fruits[0]}"
echo "All fruits: ${fruits[@]}"
echo "Number of fruits ${#fruits[@]}"
echo "Last fruit: ${fruits[-1]}"
echo "Second last fruit: ${fruits[-2]}"

# Removing Elements
unset fruits[2]
echo "All fruits: ${fruits[@]}"

# Sorting Arrays
sorted_fruits=("${fruits[@]}")
echo "Sorted fruits: ${sorted_fruits[@]}"

# Reversing Arrays
reversed_fruits=("${fruits[@]}")
echo "Reversed fruits: ${reversed_fruits[@]}"

# Joining Arrays
joined_fruits=$(IFS=", " ; echo "${fruits[*]}")
echo "Joined fruits: $joined_fruits"

# Splitting Arrays
IFS=", " read -r -a split_fruits <<< "$joined_fruits"
echo "Split fruits: ${split_fruits[@]}"

# Looping Arrays
for fruit in "${fruits[@]}"; do
    echo "Fruit: $fruit"
done


