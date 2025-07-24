# Shell Scripting Basics - Beginner's Guide

## What is Shell Scripting?
A shell script is a text file containing a sequence of commands that are executed by the shell (command interpreter). It's like automating commands you would normally type one by one.

## 1. Getting Started

### Creating Your First Script
```bash
#!/bin/bash
echo "Hello, World!"
```

- `#!/bin/bash` - This is called a "shebang" or "hashbang". It tells the system which interpreter to use
- Save the file with `.sh` extension (e.g., `myscript.sh`)
- Make it executable: `chmod +x myscript.sh`
- Run it: `./myscript.sh`

## 2. Variables

In shell scripting variables are used to store values that can be used throughout the script. Variables are declared by assigning a value to a name. Examples are as shown below:

### Basic Variable Declaration
```bash
#!/bin/bash

# Variable assignment (no spaces around =)
name="John"
age=25
PI=3.14159

# Using variables (with $ prefix)
echo "Name: $name"
echo "Age: $age"
echo "Pi: $PI"
```

### Variable Rules
- No spaces around the `=` sign
- Use `$` to access variable value
- Variable names are case-sensitive
- Use `${variable}` for complex cases: `echo "Hello ${name}!"`

### Special Variables
```bash
#!/bin/bash
echo "Script name: $0"
echo "First argument: $1"
echo "Second argument: $2"
echo "All arguments: $@"
echo "Number of arguments: $#"
echo "Exit status of last command: $?"
```

## 3. Input and Output

### Reading User Input
```bash
#!/bin/bash
echo "What's your name?"
read name
echo "Hello, $name!"

# Reading with prompt
read -p "Enter your age: " age
echo "You are $age years old"
```

**Note:** The `read` command is used to read input from the user. The `-p` option is used to display a prompt message just like the -m option in the in git commit command that is used to add a message to the commit. -p is a short form of --prompt. These are flags or options that are used to modify the behavior of a command. 

### Input from a file

The example below shows how to read input from a file:

```bash
#!/bin/bash
echo "Reading from file..."
while read line; do
    echo "$line"
done < input.txt
```

**Note:** The `<` (called redirection operator) is used to redirect input from a file. It is a short form of `--input` or `--in` flag or option.

### Redirecting Output

The example below shows how to redirect output to a file:

```bash
#!/bin/bash
echo "Hello, World!" > output.txt
```

**Note:** The `>` (called redirection operator) is used to redirect output to a file. It is a short form of `--output` or `--out` flag or option.

### Appending Output

The example below shows how to append output to a file:

```bash
#!/bin/bash
echo "Hello, World!" >> output.txt
```

**Note:** The `>>` (called redirection operator) is used to append output to a file. It is a short form of `--append` or `-a` flag or option. to append means to add to the end of a file. if you want to overwrite a file, you can use the `>` operator. `>` is a short form of `--output` or `--out` flag or option.

### Echo vs Printf

The echo command is used to print a line of text to the terminal. The printf command is used to print a formatted string to the terminal. The main difference between the two is that printf allows you to format the string using placeholders.

```bash
#!/bin/bash
# Echo (simpler)
echo "Hello World"

# Printf (more control)
printf "Name: %s, Age: %d\n" "John" 25 

#where %s is for string and %d is for integer
# \n is for new line
```

The output for the above printf command will look like this:

```bash
Name: John, Age: 25
```

The way the printf command works is that it takes the string "Name: %s, Age: %d\n" and replaces the %s with the string "John" and the %d with the integer 25. The \n is for new line. That is you specify the variables to be used in the command first, then the values of the variables. Another more complex example is:

```bash
#!/bin/bash
printf "%s goes to %s,\n\nevery day by  %s and comes back home at %s.\n\nHe is a %d years old" "John" "Moringa School" 5:00pm "noon" 8
```
### Comparison Operators
```bash
# Numeric comparisons
-eq  # equal
-ne  # not equal
-gt  # greater than
-ge  # greater than or equal
-lt  # less than
-le  # less than or equal

# String comparisons
=    # equal
!=   # not equal
-z   # empty string
-n   # non-empty string

# File tests
-f   # file exists and is regular file
-d   # directory exists
-r   # file is readable
-w   # file is writable
-x   # file is executable
```
### Example of empty string
```bash
#!/bin/bash
name=""
if [ -z "$name" ]; then
    echo "Name is empty"
fi
```

The above is read as "if the string is empty, then echo "Name is empty"." also read as if zero is true for value of name string, then echo "Name is empty".

The -z option is used to check if a string is empty. It is a short form of `--zero` or `--empty` flag or option.

### Example of File Tests
```bash
#!/bin/bash
file="test.txt"

# Check if file exists
if [ -f "$file" ]; then
    echo "File exists"
else
    echo "File does not exist"
fi
```

The above is read as "if the file exists, then echo "File exists". else echo "File does not exist"." also read as if file is true for value of file string, then echo "File exists". else echo "File does not exist".

The -f option is used to check if a file exists and is a regular file. It is a short form of `--file` or `--regular-file` flag or option. To check if a folder exists, you can use the -d option.

## 4. Conditional Statements

### If-Then-Else
```bash
#!/bin/bash
read -p "Enter a number: " num

if [ $num -gt 10 ]; then
    echo "Number is greater than 10"
elif [ $num -eq 10 ]; then
    echo "Number is exactly 10"
else
    echo "Number is less than 10"
fi
```

### Examples of Conditionals
```bash
#!/bin/bash
file="test.txt"

# Check if file exists
if [ -f "$file" ]; then
    echo "File exists"
else
    echo "File does not exist"
fi

# String comparison
name="admin"
if [ "$name" = "admin" ]; then
    echo "Welcome, admin!"
fi
```

## 5. Loops

### For Loop
```bash
#!/bin/bash

# Loop through a list
for fruit in apple banana cherry; do
    echo "I like $fruit"
done

# Loop through numbers
for i in {1..5}; do
    echo "Number: $i"
done

# C-style for loop
for ((i=1; i<=5; i++)); do
    echo "Count: $i"
done
```

### While Loop
```bash
#!/bin/bash
counter=1

while [ $counter -le 5 ]; do
    echo "Counter: $counter"
    counter=$((counter + 1))
done
```

### Until Loop
```bash
#!/bin/bash
counter=1

until [ $counter -gt 5 ]; do
    echo "Counter: $counter"
    counter=$((counter + 1))
done
```

## 6. Functions

### Basic Function Syntax
```bash
#!/bin/bash

# Function definition
greet() {
    echo "Hello, $1!"
}

# Call Function
greet("Alice")

# Function with return value
add_numbers() {
    local num1=$1
    local num2=$2
    local sum=$((num1 + num2))
    echo $sum  # This becomes the return value
}

#Where
#local means the variable is only accessible within the function
# $1 means the first argument passed to the function
# $2 means the second argument passed to the function

# Calling functions
greet "Alice"
result=$(add_numbers 5 3)
echo "Sum: $result"
```

### Function with Local Variables
```bash
#!/bin/bash
calculate_area() {
    local length=$1
    local width=$2
    local area=$((length * width))
    echo "Area: $area"
}

calculate_area 10 5
```

## 7. Arrays

### Basic Array Operations
```bash
#!/bin/bash

# Array declaration
fruits=("apple" "banana" "cherry")

# Adding elements
fruits[3]="date"
fruits+=("elderberry")

# Accessing elements
echo "First fruit: ${fruits[0]}"
echo "All fruits: ${fruits[@]}"
echo "Number of fruits: ${#fruits[@]}"

# Looping through array
for fruit in "${fruits[@]}"; do
    echo "Fruit: $fruit"
done
```

## 8. Command Substitution

### Capturing Command Output

The command substitution is used to capture the output of a command and store it in a variable. It is a short form of `--command-substitution` or `--command-sub` flag or option.

```bash
#!/bin/bash

# Method 1: Using $()
# $(command) is a short form of `command` or `--command` flag or option
current_date=$(date)
echo "Today is: $current_date"

# Where date is a command that returns the current date

# Method 2: Using backticks (older method)
current_user=`whoami`
echo "Current user: $current_user"

# Where whoami is a command that returns the current user

# Examples
file_count=$(ls | wc -l)
echo "Files in directory: $file_count"

# Where ls is a command that lists the contents of a directory and wc is a command that counts the number of lines. wc means word count and having the -l option means count the number of lines. the | is a pipe that takes the output of the ls command and passes it to the wc command.
```


## 9. Case Statements

### Switch-like Logic
```bash
#!/bin/bash
read -p "Enter a color (red/green/blue): " color

case $color in
    red)
        echo "You chose red!"
        ;;
    green)
        echo "You chose green!"
        ;;
    blue)
        echo "You chose blue!"
        ;;
    *)
        echo "Unknown color"
        ;;
esac

# where red, green, blue are the cases and * is the default case. the ;; sign means
```

## 10. Error Handling

### Exit Codes and Error Checking
```bash
#!/bin/bash

# Check if command succeeded
if cp source.txt backup.txt; then
    echo "File copied successfully"
else
    echo "Failed to copy file"
    exit 1
fi

# Set error handling
set -e  # Exit on any error
set -u  # Exit on undefined variables
```

## 11. Practical Examples

### File Backup Script
```bash
#!/bin/bash
source_dir="$HOME/Documents"
backup_dir="$HOME/Backup"
timestamp=$(date +%Y%m%d_%H%M%S)

echo "Creating backup..."
if [ ! -d "$backup_dir" ]; then
    mkdir -p "$backup_dir"

    # where ! -d means if the directory doesn't exist, then create it and mkdir is a command that creates a directory and -p option means create parent directories if they don't exist. 
fi

cp -r "$source_dir" "$backup_dir/backup_$timestamp"
echo "Backup completed: $backup_dir/backup_$timestamp"
```

### System Information Script
```bash
#!/bin/bash
echo "=== System Information ==="
echo "Date: $(date)"
echo "Uptime: $(uptime)"
echo "Current User: $(whoami)"
echo "Current Directory: $(pwd)"
echo "Disk Usage:"
df -h | head -5
```

### Menu-Driven Script
```bash
#!/bin/bash
while true; do
    echo "=== Main Menu ==="
    echo "1. Show date"
    echo "2. List files"
    echo "3. Show disk usage"
    echo "4. Exit"
    read -p "Choose an option: " choice
    
    case $choice in
        1)
            date
            ;;
        2)
            ls -la
            ;;
        3)
            df -h
            ;;
        4)
            echo "Goodbye!"
            exit 0
            ;;
        *)
            echo "Invalid option"
            ;;
    esac
    echo ""
done
```

## 12. Best Practices

### Script Structure
```bash
#!/bin/bash

# Script: backup.sh
# Purpose: Backup important files
# Author: Your Name
# Date: 2025-07-22

# Set error handling
set -e
set -u

# Where -e 

# Define variables at the top
SOURCE_DIR="/home/user/documents"
BACKUP_DIR="/backup"
LOG_FILE="/var/log/backup.log"

# Main function
main() {
    echo "Starting backup process..."
    # Your main logic here
}

# Call main function
main "$@"
```

### Important Tips
1. **Always quote variables**: Use `"$variable"` instead of `$variable`
2. **Use meaningful variable names**: `user_count` instead of `uc`
3. **Add comments**: Explain what your code does
4. **Check for errors**: Use `set -e` and check command exit codes
5. **Make scripts executable**: `chmod +x script.sh`
6. **Test your scripts**: Run them with different inputs

## 13. Common Mistakes to Avoid

```bash
# Wrong - spaces around =
name = "John"

# Correct
name="John"

# Wrong - missing quotes
if [ $name = admin ]; then

# Correct
if [ "$name" = "admin" ]; then

# Wrong - using = for numbers
if [ $num = 5 ]; then

# Correct - using -eq for numbers
if [ $num -eq 5 ]; then
```

## Practice Exercises

1. Write a script that asks for your name and age, then calculates what year you were born
2. Create a script that checks if a file exists, and if not, creates it
3. Write a script that counts the number of files in the current directory
4. Create a simple calculator script that can add, subtract, multiply, and divide two numbers
5. Write a script that backs up all `.txt` files to a backup directory

Start with these basics, and gradually work your way up to more complex scripts. Practice is key to mastering shell scripting!