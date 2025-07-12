#!/bin/bash

# Function to display the multiplication table using list form
function display_list_form() {
    local num=$1
    local start=$2
    local end=$3
    local reverse=$4
    
    echo -e "\nUsing List Form:"
    echo "================"
    if [ "$reverse" = "true" ]; then
        for i in $(seq $end -1 $start); do
            echo "$num x $i = $((num * i))"
        done
    else
        for i in $(seq $start $end); do
            echo "$num x $i = $((num * i))"
        done
    fi
}

# Function to display the multiplication table using C-style for loop
function display_c_style() {
    local num=$1
    local start=$2
    local end=$3
    local reverse=$4
    
    echo -e "\nUsing C-style For Loop:"
    echo "===================="
    if [ "$reverse" = "true" ]; then
        for ((i=end; i>=start; i--)); do
            echo "$num x $i = $((num * i))"
        done
    else
        for ((i=start; i<=end; i++)); do
            echo "$num x $i = $((num * i))"
        done
    fi
}

# Function to get valid number input
function get_number() {
    local prompt=$1
    local num
    while true; do
        read -p "$prompt" num
        if [[ $num == "q" ]]; then
            echo "q"
            return 0
        elif [[ $num =~ ^-?[0-9]+$ ]]; then
            echo $num
            return 0
        else
            echo "Error: Please enter a valid number or 'q' to quit." >&2
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
        # Get start value
        while true; do
            start=$(get_number "$start_prompt")
            if [[ $start == "q" ]]; then
                echo "q"
                return 1
            fi
            break
        done
        
        # Get end value
        while true; do
            end=$(get_number "$end_prompt")
            if [[ $end == "q" ]]; then
                echo "q"
                return 1
            fi
            break
        done
        
        if [ $start -le $end ]; then
            echo "$start $end"
            return 0
        else
            echo "Error: Start value must be less than or equal to end value." >&2
            # Clear the error message from the output
            continue
        fi
    done
}

# Main script
clear #Clears the terminal
echo "=== Multiplication Table Generator ==="

#Main loop
while true; do
    # Get the number for the multiplication table
    number=$(get_number "\nEnter a number (or 'q' to quit): ")
    
    # Check if user wants to quit
    if [[ $number == "q" ]]; then
        echo "Goodbye!"
        exit 0
    fi
    
    # Ask for table type
    echo "=======Table Type==========="
    while true; do
        read -p "\nChoose table type (f for full, p for partial, b for both, q to quit): " choice

        # Handle invalid input
        case $choice in
            [fF] )
                # Full table (1-10)
                while true; do
                    read -p "\nDisplay in reverse order? (y/n): " reverse
                    case $reverse in
                        [yY] )
                            echo -e "\nGenerating full multiplication table for $number (10-1):"
                            display_list_form $number 1 10 true
                            display_c_style $number 1 10 true
                            break
                            ;;
                        [nN] )
                            echo -e "\nGenerating full multiplication table for $number (1-10):"
                            display_list_form $number 1 10 false
                            display_c_style $number 1 10 false
                            break
                            ;;
                        * )
                            echo "Please enter y or n."
                            ;;
                    esac
                done
                break
                ;;
            [pP] )
                # Partial table with custom range
                echo -e "\nEnter the range for the multiplication table:"
                range_output=$(get_range "Start value: " "End value: ")
                if [[ $? -ne 0 ]]; then
                    if [[ $range_output == "q" ]]; then
                        echo "Returning to main menu..."
                        break
                    fi
                    continue
                fi
                read -r start end <<< "$range_output"
                while true; do
                    read -p "\nDisplay in reverse order? (y/n): " reverse
                    case $reverse in
                        [yY] )
                            echo -e "\nGenerating partial multiplication table for $number ($end-$start):"
                            display_list_form $number $start $end true
                            display_c_style $number $start $end true
                            break
                            ;;
                        [nN] )
                            echo -e "\nGenerating partial multiplication table for $number ($start-$end):"
                            display_list_form $number $start $end false
                            display_c_style $number $start $end false
                            break
                            ;;
                        * )
                            echo "Please enter y or n."
                            ;;
                    esac
                done
                break
                ;;
            [bB] )
                # Both full and partial tables
                echo -e "\nEnter the range for the partial multiplication table:"
                range_output=$(get_range "Start value: " "End value: ")
                if [[ $? -ne 0 ]]; then
                    if [[ $range_output == "q" ]]; then
                        echo "Returning to main menu..."
                        break
                    fi
                    continue
                fi
                read -r start end <<< "$range_output"
                while true; do
                    read -p "\nDisplay in reverse order? (y/n): " reverse
                    case $reverse in
                        [yY] )
                            echo -e "\nGenerating full multiplication table for $number (10-1):"
                            display_list_form $number 1 10 true
                            display_c_style $number 1 10 true
                            echo -e "\nGenerating partial multiplication table for $number ($end-$start):"
                            display_list_form $number $start $end true
                            display_c_style $number $start $end true
                            break
                            ;;
                        [nN] )
                            echo -e "\nGenerating full multiplication table for $number (1-10):"
                            display_list_form $number 1 10 false
                            display_c_style $number 1 10 false
                            echo -e "\nGenerating partial multiplication table for $number ($start-$end):"
                            display_list_form $number $start $end false
                            display_c_style $number $start $end false
                            break
                            ;;
                        * )
                            echo "Please enter y or n."
                            ;;
                    esac
                done
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
    while true; do
        read -p "\nWould you like to generate another table? (y/n): " continue_choice
        case $continue_choice in
            [Yy] )
                break
                ;;
            [Nn] )
                echo "Goodbye!"
                exit 0
                ;;
            * )
                echo "Error: Please enter 'y' for yes or 'n' for no."
                ;;
        esac
    done
done

exit 0
