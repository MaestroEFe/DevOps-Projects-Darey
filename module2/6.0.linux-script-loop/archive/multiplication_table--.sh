#!/bin/bash

# Function to display the multiplication table using list form
function display_list_form() {
    local num=$1
    local start=$2
    local end=$3
    local reverse=$4
    
    echo -e "\nUsing List Form:"
    echo "================"
    if [ "$reverse" = "y" ]; then
        for i in $(seq $end -1 $start); do
            printf "%2d x %2d = %4d\n" $num $i $((num * i))
        done
    else
        for i in $(seq $start $end); do
            printf "%2d x %2d = %4d\n" $num $i $((num * i))
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
    if [ "$reverse" = "y" ]; then
        for ((i=end; i>=start; i--)); do
            printf "%2d x %2d = %4d\n" $num $i $((num * i))
        done
    else
        for ((i=start; i<=end; i++)); do
            printf "%2d x %2d = %4d\n" $num $i $((num * i))
        done
    fi
}

# Function to get valid number input or quit
function get_number() {
    local prompt=$1
    local num
    while true; do
        read -p "$prompt" num
        if [[ $num =~ ^-?[0-9]+$ ]]; then
            if [[ $num -gt 1000 || $num -lt -1000 ]]; then
                echo "Error: Number must be between -1000 and 1000."
                continue
            fi
            echo $num
            return 0
        elif [[ $num == "q" ]]; then
            echo $num
            return 0
        else
            echo "Error: Please enter a valid number or 'q' to quit."
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
        if [[ $start == "q" ]]; then
            echo "Goodbye!"
            exit 0
        fi
        end=$(get_number "$end_prompt")
        if [[ $end == "q" ]]; then
            echo "Goodbye!"
            exit 0
        fi
        if [ $start -le $end ]; then
            if [[ $((end - start)) -gt 1000 ]]; then
                echo "Error: Range too large (max 1000)."
                continue
            fi
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

# Main loop
while true; do
    number=$(get_number "\nEnter a number for the multiplication table (or 'q' to quit): ")
    if [[ $number == "q" ]]; then
        echo "Goodbye!"
        exit 0
    fi
    
    # Ask for table type
    while true; do
        read -p "\nChoose table type (f for full, p for partial, b for both, q to quit): " choice
        case $choice in
            [fF] )
                while true; do
                    read -p "\nDisplay in reverse order? (y/n): " reverse
                    case $reverse in
                        [yY] )
                            echo -e "\nGenerating full multiplication table for $number (in reverse order, 10 to 1):"
                            display_list_form $number 1 10 y
                            display_c_style $number 1 10 y
                            break
                            ;;
                        [nN] )
                            echo -e "\nGenerating full multiplication table for $number (1 to 10):"
                            display_list_form $number 1 10 n
                            display_c_style $number 1 10 n
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
                echo -e "\nEnter the range for the multiplication table:"
                read -r start end <<< $(get_range "Start value: " "End value: ")
                while true; do
                    read -p "\nDisplay in reverse order? (y/n): " reverse
                    case $reverse in
                        [yY] )
                            echo -e "\nGenerating partial multiplication table for $number (in reverse order, $end to $start):"
                            display_list_form $number $start $end y
                            display_c_style $number $start $end y
                            break
                            ;;
                        [nN] )
                            echo -e "\nGenerating partial multiplication table for $number ($start to $end):"
                            display_list_form $number $start $end n
                            display_c_style $number $start $end n
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
                echo -e "\nEnter the range for the partial multiplication table:"
                read -r start end <<< $(get_range "Start value: " "End value: ")
                while true; do
                    read -p "\nDisplay in reverse order? (y/n): " reverse
                    case $reverse in
                        [yY] )
                            echo -e "\nGenerating full multiplication table for $number (in reverse order, 10 to 1):"
                            display_list_form $number 1 10 y
                            display_c_style $number 1 10 y
                            echo -e "\nGenerating partial multiplication table for $number (in reverse order, $end to $start):"
                            display_list_form $number $start $end y
                            display_c_style $number $start $end y
                            break
                            ;;
                        [nN] )
                            echo -e "\nGenerating full multiplication table for $number (1 to 10):"
                            display_list_form $number 1 10 n
                            display_c_style $number 1 10 n
                            echo -e "\nGenerating partial multiplication table for $number ($start to $end):"
                            display_list_form $number $start $end n
                            display_c_style $number $start $end n
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
            [yY] )
                break
                ;;
            [nN] )
                echo "Goodbye!"
                exit 0
                ;;
            * )
                echo "Invalid choice. Please enter 'y' or 'n'."
                ;;
        esac
    done
done

exit 0