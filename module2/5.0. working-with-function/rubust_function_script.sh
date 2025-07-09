# #!/bin/bash

# # Enviroment variable
# ENVIRONMENT=$1

# # Function to check number of arguments
# check_num_of_args() {
#     if [ "$#" -ne 1 ]; then
#         echo "Usage: $0 <environment>"
#         exit 1
#     fi
# }

# # function to activate infrastructure environment
# activate_infra_environment() {
#     if [ "$ENVIRONMENT" == "local" ]; then
#         echo "Running script for local environment..."
#     elif [ "$ENVIRONMENT" == "testing" ]; then
#         echo "Running script for testing environment..."
#     elif [ "$ENVIRONMENT" == "production" ]; then
#         echo "Running script for production environment..."
#     else
#         echo "Invalid environment specified. Please use local, testing, staging or production."
#         exit 2
#     fi
# }

# # Function to check if AWS CLI is installed
# check_aws_cli() {  
#     if ! command -v aws &> /dev/null; then
#         echo "AWS CLI is not installed. Please install it before running this script."
#         return 1
#     fi
# }

# # Function to check if AWS profile is set
# check_aws_profile() {
#     if [ -z "$AWS_PROFILE" ]; then
#         echo "AWS profile is not set. Please set it before running this script."
#         return 1
#     fi
# }

# # Function to check if AWS credentials are configured
# check_aws_credentials() {
#     if [ -z "$AWS_ACCESS_KEY_ID" ] || [ -z "$AWS_SECRET_ACCESS_KEY" ] || [ -z "$AWS_DEFAULT_REGION" ]; then
#         echo "AWS credentials are not configured. Please configure them before running this script."
#         return 1
#     fi
# }

# # Call the functions
# check_num_of_args "$0"
# activate_infra_environment "$0"
# check_aws_cli 
# check_aws_profile
# check_aws_credentials


#!/bin/bash

# Function to check number of arguments
check_num_of_args() {
    if [ "$#" -ne 1 ]; then
        echo "Usage: $0 <environment>"
        exit 1
    fi
}

# Check arguments first
check_num_of_args "$@"

# Set environment variable after validation
ENVIRONMENT=$1

# Function to activate infrastructure environment
activate_infra_environment() {
    local env="$1"
    if [ "$env" == "local" ]; then
        echo "Running script for local environment..."
    elif [ "$env" == "testing" ]; then
        echo "Running script for testing environment..."
    elif [ "$env" == "production" ]; then
        echo "Running script for production environment..."
    else
        echo "Error: Invalid environment specified. Please use: local, testing, or production"
        exit 2
    fi
}

# Function to check if AWS CLI is installed
check_aws_cli() {  
    if ! command -v aws &> /dev/null; then
        echo "Error: AWS CLI is not installed. Please install it before running this script."
        return 1
    fi
}

# Function to check if AWS profile is set
check_aws_profile() {
    if [ -z "$AWS_PROFILE" ]; then
        echo "Warning: AWS profile is not set. Some operations might fail."
        return 1
    fi
}

# Function to check if AWS credentials are configured
check_aws_credentials() {
    if [ -z "$AWS_ACCESS_KEY_ID" ] || [ -z "$AWS_SECRET_ACCESS_KEY" ]; then
        echo "Error: AWS credentials are not configured."
        return 1
    fi
    if [ -z "$AWS_DEFAULT_REGION" ]; then
        echo "Warning: AWS_DEFAULT_REGION is not set."
    fi
}

# Main execution
main() {
    # Check arguments first
    check_num_of_args "$@"
    
    # Set environment
    ENVIRONMENT="$1"
    activate_infra_environment "$ENVIRONMENT"
    
    # Check AWS prerequisites
    check_aws_cli || exit 1
    check_aws_credentials || exit 1
    check_aws_profile  # Warning only
    
    echo "All checks passed. Proceeding with script execution..."
    # Add your main script logic here
}

# Run the main function with all arguments
main "$@"