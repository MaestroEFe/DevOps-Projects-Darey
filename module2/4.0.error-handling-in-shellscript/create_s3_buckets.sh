#!/bin/bash

# Function to create S3 buckets for different departments
create_s3_buckets() {
    school="DAREY"
    departments=("Biology" "Chemistry" "Physics" "Mathematics" "Computer Science")
    
    for department in "${departments[@]}"; do
        bucket_name="${school}-${department}-Data-Bucket"
        
        # Check if the bucket already exists
        if aws s3api head-bucket --bucket "$bucket_name" &>/dev/null; then
            echo "S3 bucket '$bucket_name' already exists."
        else
            # Create S3 bucket using AWS CLI
            aws s3api create-bucket --bucket "$bucket_name" --region eu-west-1 
            if [ $? -eq 0 ]; then
                echo "S3 bucket '$bucket_name' created successfully."
            else
                echo "Failed to create S3 bucket '$bucket_name'."
            fi
        fi
    done
}

create_s3_buckets
