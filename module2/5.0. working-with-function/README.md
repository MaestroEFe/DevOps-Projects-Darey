# Working with Function and Arrays in Shell Scripting

In this mini-project, we will focus on some other essential concepts in shell scripting.

Remember the overall goe is to develop a shell script for one of Datawise solution's clients for the previous project, that automates the setup of EC2 instances and S3 buckets for different departments. Part of the critical elements we will be focusing on in this project is the use of functions and arrays.

## Functions

Organizing your code is key to maintaining clarity and efficiency. On powerful techniques for archieving this is through the use of functions.

By encapsulating code into functions, you can make your scripts more modular, reusable, and easier to maintain. Functions allow you to group related code together, making it easier to understand and modify. They also help prevent code duplication and make it easier to debug and test. Going forward, we will be creating functions for every piece of requirements we wish to satisfy.

Let's consider the following logic and encapsulate them in functions:


1. Check if script has an argument

2. Check if AWS CLI is installed

3. Check if environment variables exist to authenticate to AWs

To create a fuction in a shell script, you simply have to define it using the following syntax:

function_name() {
    commands
}

Here is the breakdown of the syntax:

- function_name: The name of the function
- (): The parentheses define the function body
- {}: The curly braces define the function body
- commands: The commands to be executes within the function body

or if in bash command interface

## Function: Check if script has an argument

Let's take the same code in the previous mini project and encapsulate it in a function.

Here is the code below without a function.

```bash
#!/bin/bash

#check the number of the arguments
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <environment>"
    exit 1
fi

#Where "$#" is the number of arguments passed to the script, and "-ne 1" checks if the number of arguments is not equal to 1.
#And echo "Usage: $0 <environment>" is used to display the usage message. 
# $0 is the name of the script. and <environment> is the argument passed to the script.

# Assessing the first argument
ENVIRONMENT=$1

# Acting base on the argument value
if [ "$ENVIRONMENT" == "local" ]; then
    echo "Running script for local environment..."
    elif [ "$ENVIRONMENT" == "testing" ]; then
    echo "Running script for testing environment..."
    elif [ "$ENVIRONMENT" == "production" ]; then
    echo "Running script for production environment..."
    else
    echo "Invalid environment specified. Please use local, testing, staging or production."
    exit 2
    fi
```

it would look like this with a function called **check_num_of_args**.

```bash
check_num_of_args() {
    if [ "$#" -ne 1 ]; then
        echo "Usage: $0 <environment>"
        exit 1
    fi
}

# Assessing the first argument
ENVIRONMENT=$1

# Acting base on the argument value
if [ "$ENVIRONMENT" == "local" ]; then
    echo "Running script for local environment..."
    elif [ "$ENVIRONMENT" == "testing" ]; then
    echo "Running script for testing environment..."
    elif [ "$ENVIRONMENT" == "staging" ]; then
    echo "Running script for staging environment..."
    elif [ "$ENVIRONMENT" == "production" ]; then
    echo "Running script for production environment..."
    else
    echo "Invalid environment specified. Please use local, testing, staging or production."
    exit 2
    fi
```
When a function is defined in a shell script, it remains inactive until it is invoked or called within script. To execute the code within the function, you must place a call to the function in a relevant part of your script.

It's crucial to consider the order in which the interpreter evaluates each line of code. Placing the function where it logically fits within the flow of your script ensures that it is available and ready to be executed when needed. This organization helps maintain the readability and coherence of your code, making it easier to understand and maintain.

let's see what that would now look like;

```bash
#!/bin/bash

# Enviroment variable
ENVIRONMENT=$1

check_num_of_args() {
    # check the number of arguments
    if [ "$#" -ne 1 ]; then
        echo "Usage: $0 <environment>"
        exit 1
    fi
}

check_num_of_args

# Acting based on the argument value

if [ "$ENVIRONMENT" == "local" ]; then 
    echo "Running script for local environment..."
elif [ "$ENVIRONMENT" == "testing" ]; then 
    echo "Running script for testing environment..."
elif [ "$ENVIRONMENT" == "production" ]; then 
    echo "Running script for production environment..."
else
    echo "Invalid environment specified. Please use local, testing, staging or production."
    exit 2
fi
```
    
With a refactored version of the code, we now have the flow like this;

1. Enviroment variable moved to the top
2. Function defined
3. Function called
4. Activate based on infrastructure environment section.

What we could also do is encapsulate number 4 in a function and call all the functions in the end of the script. This is what you would see most times in the real world.

Let see what that would look like;

```bash
#!/bin/bash

# Enviroment variable
ENVIRONMENT=$1

check_num_of_args() {
    # check the number of arguments
    if [ "$#" -ne 1 ]; then
        echo "Usage: $0 <environment>"
        exit 1
    fi
}

activate_infra_environment() {
    # Acting based on the argument value
    if [$ENVIRONMENT == "local"] then
        echo "Running script for local environment..."
    elif [$ENVIRONMENT == "testing"] then
        echo "Running script for testing environment..."
    elif [$ENVIRONMENT == "production"] then
        echo "Running script for production environment..."
    else
        echo "Invalid environment specified. Please use local, testing, staging or production."
        exit 2
    fi
}


check_num_of_args
activate_infra_environment
```
With the updated version of the code, you can now see how clean the code looks.  You can easily understand what each function is doing based on it's name, comments and the order in whihc the functions are called at the end of the script.

# Checking if AWS CLI is installed

```bash
#!/bin/bash

# Function to check if AWS CLI is installed
check_aws_cli() {  
    if ! command -v aws &> /dev/null; then
        echo "AWS CLI is not installed. Please install it before running this script."
        return 1
    fi
}
```
Where;

- **if ! command -v aws &> /dev/null; then:** This line contains an if statement. 
    - the ! operator negates the condition, so it returns true if the command is not found.
    - the command -v aws checks if the AWS CLI is installed.
    - the &> /dev/null redirects any output to /dev/null, which suppresses any error messages.
        - the **&>** operator redirects both standard output (stdout) and standard error (stderr) to the specified file or device.
        - the **/dev/null** is a special file that discards any data written to it.
    - the **then** keyword marks the start of the if block.
- **echo "AWS CLI is not installed. Please install it before running this script."** This line is executed if the condition is true.
- **return 1** This line returns a non-zero exit status, indicating that the function has failed.
- **fi** This line marks the end of the if block.

To call the function, you would use the following syntax:
```bash
check_aws_cli
```

## Checking if environment variables exist to authenticate to AWS

To programmatically create a resources in AWS, you need to configure authentication using various means such as environment variables, AWS credentials/configuration file, IAM roles, etc.

The ~/.aws/credentials and ~/.aws/config files are used to store the credentials and configuration respectively for the AWS CLI.

The AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, and AWS_DEFAULT_REGION environment variables are used to store the credentials and configuration respectively for the AWS CLI.

Running the aws configure command you ran ealier creaes these files. You can use the cat command to open them and check their contents.

**credentials file (~/.aws/credentials)**

The credentials file typically contains AWS credentials and configuration settings, respectively. You will have only default sections at first. But you can add other envireonments as required. Just as we have for testing and production below.

It is formatted as follows:

```bash
[default]
aws_access_key_id = YOUR_ACCESS_KEY_ID
aws_secret_access_key = YOUR_SECRET_ACCESS_KEY
aws_default_region = YOUR_DEFAULT_REGION

[profile testing]
aws_access_key_id = YOUR_ACCESS_KEY_ID
aws_secret_access_key = YOUR_SECRET_ACCESS_KEY
aws_default_region = YOUR_DEFAULT_REGION

[profile production]
aws_access_key_id = YOUR_ACCESS_KEY_ID
aws_secret_access_key = YOUR_SECRET_ACCESS_KEY
aws_default_region = YOUR_DEFAULT_REGION
```


**config file (~/.aws/config)**

The config file typically contains AWS configuration settings, respectively. You will have only default sections at first. But you can add other envireonments as required. Just as we have for testing and production below.

It is formatted as follows:

```bash
[default]
region = YOUR_DEFAULT_REGION
output = json

[profile testing]
region = YOUR_DEFAULT_REGION
output = json

[profile production]
region = YOUR_DEFAULT_REGION
output = json
```

A profile will enable you to easily switch between different AWS accounts and regions. If you  set an environment variable by running the command `export AWS_PROFILE=testing`, this will pick up the configuration from both files and authenticate you to the testing environment.

**AWS Profile:** The AWS_PROFILE environment variable allows users to specify which profile to use from their AWS config and credential files. If AWS_PROFILE  is not set, the default profile is used.

Here is what the function would look like:

```bash
# Function to check if AWS profile is set

check_aws_profile() {
    if [ -z "$AWS_PROFILE" ]; then
        echo "AWS profile is not set. Please set it before running this script."
        return 1
    fi
}
```
Where;

- **if [ -z "$AWS_PROFILE" ]; then:** This line contains an if statement.
    - the **-z** operator checks if a string is empty, i.e, if the values stores in the variable AWS_PROFILE is zero or empty.
    - the **then** keyword marks the start of the if block.
- **echo "AWS profile is not set. Please set it before running this script."** This line is executed if the condition is true.
- **return 1** This line returns a non-zero exit status, indicating that the function has failed.
- **fi** This line marks the end of the if block.

To call the function, you would use the following syntax:
```bash
check_aws_profile
```

```bash
#!/bin/bash

# Function to check if environment variables exist to authenticate to AWS
check_aws_credentials() {
    if [ -z "$AWS_ACCESS_KEY_ID" ] || [ -z "$AWS_SECRET_ACCESS_KEY" ] || [ -z "$AWS_DEFAULT_REGION" ]; then
        echo "AWS credentials are not configured. Please configure them before running this script."
        return 1
    fi
}

check_aws_credentials
```
Where;

- **if [ -z "$AWS_ACCESS_KEY_ID" ] || [ -z "$AWS_SECRET_ACCESS_KEY" ] || [ -z "$AWS_DEFAULT_REGION" ]; then:** This line contains an if statement.
    - the **-z** operator checks if a string is empty.
    - the **||** operator is a logical OR operator, so it returns true if any of the conditions are true.
    - the **then** keyword marks the start of the if block.
- **echo "AWS credentials are not configured. Please configure them before running this script."** This line is executed if the condition is true.
- **return 1** This line returns a non-zero exit status, indicating that the function has failed.
- **fi** This line marks the end of the if block.

To call the function, you would use the following syntax:
```bash
check_aws_credentials
```
Our shell script will now look like this
    
```bash
#!/bin/bash

# Enviroment variable
ENVIRONMENT=$1

# Function to check number of arguments
check_num_of_args() {
    if [ "$#" -ne 1 ]; then
        echo "Usage: $0 <environment>"
        exit 1
    fi
}

# function to activate infrastructure environment
activate_infra_environment() {
    if [$ENVIRONMENT == "local"]; then
        echo "Running script for local environment..."
    elif [$ENVIRONMENT == "testing"]; then
        echo "Running script for testing environment..."
    elif [$ENVIRONMENT == "production"]; then
        echo "Running script for production environment..."
    else
        echo "Invalid environment specified. Please use local, testing, staging or production."
        exit 2
    fi
}

# Function to check if AWS CLI is installed
check_aws_cli() {  
    if ! command -v aws &> /dev/null; then
        echo "AWS CLI is not installed. Please install it before running this script."
        return 1
    fi
}

# Function to check if AWS profile is set
check_aws_profile() {
    if [ -z "$AWS_PROFILE" ]; then
        echo "AWS profile is not set. Please set it before running this script."
        return 1
    fi
}

# Function to check if AWS credentials are configured
check_aws_credentials() {
    if [ -z "$AWS_ACCESS_KEY_ID" ] || [ -z "$AWS_SECRET_ACCESS_KEY" ] || [ -z "$AWS_DEFAULT_REGION" ]; then
        echo "AWS credentials are not configured. Please configure them before running this script."
        return 1
    fi
}

# Call the functions
check_num_of_args
activate_infra_environment
check_aws_cli
check_aws_profile
check_aws_credentials
```
Updated script:

```bash
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
```
## Summary

In this project, I learned how to create robust shell scripts with proper error handling and AWS integration. The key lessons include: implementing argument validation to ensure correct script usage, creating modular functions for environment activation and AWS configuration checks, understanding AWS authentication methods (profiles, environment variables, and IAM roles), and following best practices for script organization and error handling. The project also emphasized the importance of validating AWS CLI installation, checking for required environment variables, and implementing proper exit codes for error conditions, all while maintaining clean, maintainable code structure with clear function definitions and usage patterns.
