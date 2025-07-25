#!/bin/bash

# AWS IAM Manager Script for CloudOps Solutions
# This script automates the creation of IAM users, groups, and permissions

# Define IAM User Names Array
IAM_USER_NAMES=("dev1" "dev2" "dev3" "dev4" "dev5")

# Function to create IAM users
create_iam_users() {
    echo "Starting IAM user creation process..."
    echo "-------------------------------------"
    
    for user in "${IAM_USER_NAMES[@]}"; do
        echo "Creating IAM user: $user"
        aws iam create-user --user-name "$user"
        
        # Check if user was created successfully
        if [ $? -eq 0 ]; then #where $? is the exit status of the last command
            echo "Successfully created IAM user: $user"
        else
            echo "Error: Failed to create IAM user: $user"
            exit 1
        fi
    done
    
    echo "------------------------------------"
    echo "IAM user creation process completed."
    echo ""
}

# Function to create admin group and attach policy
# This function helps to create an admin group and attach the AdministratorAccess policy to it

create_admin_group() {
    echo "Creating admin group and attaching policy..."
    echo "--------------------------------------------"
    
    # Check if group already exists
    if ! aws iam get-group --group-name "admin" >/dev/null 2>&1; then
        echo "Creating admin group..."
        aws iam create-group --group-name "admin"
        if [ $? -ne 0 ]; then
            echo "Error: Failed to create admin group"
            exit 1
        fi
    else
        echo "Admin group already exists, skipping creation..."
    fi
    
    # Attach AdministratorAccess policy
    echo "Attaching AdministratorAccess policy..."
    aws iam attach-group-policy \
        --group-name "admin" \
        --policy-arn "arn:aws:iam::aws:policy/AdministratorAccess"
        
    if [ $? -eq 0 ]; then
        echo "Success: AdministratorAccess policy attached"
    else
        echo "Error: Failed to attach AdministratorAccess policy"
    fi
    
    echo "----------------------------------"
    echo ""
}

# Function to add users to admin group
add_users_to_admin_group() {
    echo "Adding users to admin group..."
    echo "------------------------------"
    
    for user in "${IAM_USER_NAMES[@]}"; do
        echo "Adding user $user to admin group..."
        aws iam add-user-to-group \
            --group-name "admin" \
            --user-name "$user"
            
        if [ $? -eq 0 ]; then
            echo "Successfully added $user to admin group"
        else
            echo "Error: Failed to add $user to admin group"
            exit 1
        fi
    done
    
    echo "----------------------------------------"
    echo "User group assignment process completed."
    echo ""
}

# Main execution function
main() {
    echo "=================================="
    echo " AWS IAM Management Script"
    echo "=================================="
    echo ""
    
    # Verify AWS CLI is installed and configured
    if ! command -v aws &> /dev/null; then
        echo "
        Error: AWS CLI is not installed. Please install and configure it first wuith the following command: 
        
        aws configure

        then run the script again
        "
        exit 1
    fi
    
    # Execute the functions
    create_iam_users
    create_admin_group
    add_users_to_admin_group
    
    echo "=================================="
    echo " AWS IAM Management Completed"
    echo "=================================="
}

# Execute main function
main

exit 0