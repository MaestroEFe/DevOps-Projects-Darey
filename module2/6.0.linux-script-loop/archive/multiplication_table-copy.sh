#!/bin/bash

# Function to display the multiplication table using list form
function display_list_form() {
    local num=$1
    local start=$2
    local end=$3
    
    echo -e "\nUsing List Form:"

    #where -e is used to enable interpretation of backslash escapes and \n is used to insert a new line
    echo "================"
    for i in $(seq $start $end); do
        echo "$num x $i = $((num * i))"
    done
}

# Function to display the multiplication table using C-style for loop
function display_c_style() {
    local num=$1
    local start=$2
    local end=$3
    
    echo -e "\nUsing C-style For Loop:"
    echo "===================="
    for ((i=start; i<=end; i++)); do
        echo "$num x $i = $((num * i))"
    done
}

# Function to get valid number input
function get_number() {
    local prompt=$1
    local num
    while true; do
        read -p "$prompt" num
        if [[ $num =~ ^-?[0-9]+$ ]]; then
            echo $num
            return 0
        else
            echo "Error: Please enter a valid number."
        fi
    done
}

# Function to get valid range
function get_range() {
    local start_prompt=$1
    local end_prompt=$2
    local start
    local end
    
    while true; do
        start=$(get_number "$start_prompt")
        end=$(get_number "$end_prompt")
        
        if [ $start -le $end ]; then
            echo "$start $end"
            return 0
        else
            echo "Error: Start value must be less than or equal to end value."
        fi
    done
}

# Main script
clear
echo "=== Multiplication Table Generator ==="

while true; do
    # Get the number for the multiplication table
    number=$(get_number "\nEnter a number (or 'q' to quit): ")
    
    # Check if user wants to quit
    if [[ $number == "q" ]]; then
        echo "Goodbye!"
        exit 0
    fi
    
    # Ask for table type
    while true; do
        read -p "\nChoose table type (f for full, p for partial, b for both, q to quit): " choice
        case $choice in
            [fF] )
                # Full table (1-10)
                echo -e "\nGenerating full multiplication table for $number (1-10):"
                display_list_form $number 1 10
                display_c_style $number 1 10
                break
                ;;
            [pP] )
                # Partial table with custom range
                echo -e "\nEnter the range for the multiplication table:"
                read -r start end <<< $(get_range "Start value: " "End value: ")
                echo -e "\nGenerating partial multiplication table for $number ($start-$end):"
                display_list_form $number $start $end
                display_c_style $number $start $end
                break
                ;;
            [bB] )
                # Both full and partial tables
                echo -e "\nGenerating full multiplication table for $number (1-10):"
                display_list_form $number 1 10
                display_c_style $number 1 10
                
                echo -e "\nNow let's generate a partial table:"
                read -r start end <<< $(get_range "Start value: " "End value: ")
                echo -e "\nGenerating partial multiplication table for $number ($start-$end):"
                display_list_form $number $start $end
                display_c_style $number $start $end
                break
                ;;
            [qQ] )
                echo "Goodbye!"
                exit 0
                ;;
            * )
                echo "Invalid choice. Please enter 'f' for full, 'p' for partial, 'b' for both, or 'q' to quit."
                ;;
        esac
    done
    
    # Ask if user wants to continue
    read -p "\nWould you like to generate another table? (y/n): " continue_choice
    if [[ ! $continue_choice =~ ^[Yy] ]]; then
        echo "Goodbye!"
        break
    fi
done

exit 0
