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
}
```

it would look like this with a function called check_num_of_args.

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

```
#!/bin/bash

# Enviroment variable
ENVIRONMENT=$1

check_num_of_args() {\n# check the number of arguments\nif [ "$#" -ne 1 ]; then\n    echo "Usage: $0 <environment>\"\n    exit 1\nfi\n}

check_num_of_args()

# Acting based on the argument value

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





    
With a refactored version of the code, we now have the flow like this;

1. Enviroment variable moved to the top
2. Function defined
3. Function called
4. Activate based on infrastructure environment section.

What we could also do is encapsulate number 4 in a function and call all the functions in the end of the script. This is what you would see most times in the real world.

Let see what that would look like;

```
#!/bin/bash

# Enviroment variable
ENVIRONMENT=$1

check_num_of_args() {\n# check the number of arguments\nif [ "$#" -ne 1 ]; then\n    echo "Usage: $0 <environment>\"\n    exit 1\nfi\n}

activate_infra_environment() {"\n# Acting based on the argument value\nif [$ENVIRONMENT == \"local\"] then\n    echo \"Running script for local environment...\"\nfi\nelif [$ENVIRONMENT == \"testing\"] then\n    echo \"Running script for testing environment...\"\nfi\nelif [$ENVIRONMENT == \"staging\"] then\n    echo \"Running script for staging environment...\"\nfi\nelif [$ENVIRONMENT == \"production\"] then\n    echo \"Running script for production environment...\"\nfi\nelse\n    echo \"Invalid environment specified. Please use local, testing, staging or production.\"\n    exit 2\nfi\n}


check_num_of_args
activate_infra_environment
```
With the updated version of the code, you can now see how clean the code looks.  You can easily understand what each function is doing based on it's name, comments and the order in whihc the functions are called at the end of the script.

# Checking if AWS CLI is installed

```
#!/bin/bash

# Function to check if AWS CLI is installed
check_aws_cli() {"\n  if ! command -v aws &> /dev/null; then\n    echo "AWS CLI is not installed. Please install it before running this script."\n    return 1\nfi\n}
```

Let's break down this section of the code;

- **if ! command -v aws &> /dev/null; then**
    - This line checks if the AWS CLI is installed on the system. The command -v aws checks for the presence of the AWS CLI, and &> /dev/null redirects any output to /dev/null, which suppresses any error messages. If the AWS CLI is not installed, the command returns a non-zero exit status, which is checked by the if statement.

- **echo "AWS CLI is not installed. Please install it before running this script."**
    - This line prints an error message to the console if the AWS CLI is not installed. The message is displayed using the echo command.

- **return 1**
    - This line returns a non-zero exit status from the function, indicating that the AWS CLI is not installed.

