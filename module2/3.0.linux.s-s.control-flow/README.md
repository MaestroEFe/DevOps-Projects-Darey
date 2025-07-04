# Linux Shell Scripting Control Flow

# Control Flow in Shell Scripting

Control flow statements are the back backbone of making decisions in programming.  In shell scripting, these statements let your scripts decide what to do based on conditions, loops, user inputs, functions, and other factors.

Bash and other shell scripting interpreters provide several control flow statements, including:

- if-else statements

- for loops

- while loops

- until loops

- case statements

- functions

- subroutines

- exit

- break

- continue

Most likely you will get to use if-else and for loops the most. Therefore, at this level we will focus only on those two control flow statements.

## What is a control flow statement?

In simple terms, a control flow statement is a statement that controls the flow of execution in a program. It determines the order in which statements are executed and can change the flow of execution based on certain conditions. Its like the road map of your script.

## If-else statements

If-else statements are used to make decisions in shell scripts based on conditions. They allow scripts to execute different blocks of code based on whether a condition is true or false.

```bash
if [ condition ]; then
    # code to execute if condition is true
else
    # code to execute if condition is false
fi
```

### Task 1

Our script asks for a number and then tells us if that number is positive, negative or zero.

the entire script is as follows:

```bash
#!/bin/bash

# Ask for a number
read -p "Enter a number: " num

# Check if the number is positive, negative, or zero
if [ $num -gt 0 ]; then
    echo "The number is positive."
elif [ $num -lt 0 ]; then
    echo "The number is negative."
else
    echo "The number is zero."
fi
```

![if-else](img/1.0.if-else.png)

But lets start gradually and understand the script line by line.

1. create a file called `control-flow.sh`

```bash
vim control-flow.sh
```

2. Put the code below, and execute the script to experience the output.

```bash
#!/bin/bash

# Ask for a number
read -p "Enter a number: " num
```

**The script breakdown**

- The **#!/bin/bash** is called a shebang. It is used to specify the interpreter for the script. In this case, it is bash. the 
- **read -p "Enter a number: " num** is used to read a number from the user and store it in the variable num.

![control-flow](img/2.0.control-flow.png)

3. Make the script executable

```bash
chmod +x control-flow.sh
```

![control-flow](img/3.0.control-flow.png)

4. Run the script

```bash
./control-flow.sh
```

Notice that when you execute the script, it just asks you to *Enter a number:*.  Even when you type a number and hit enter, it  takes the number, but you can't visibly see what it does with the number.  That is because the read command in the script has its own way of taking inputs from the user, and stores it in the variable num passed to the read command.

The read command is used to capture user input and store it in a variable. In this case, it is used to capture the user input and store it in the variable num. When you use read followed by a variable name (in this case num), Bash waits for the user to enter a value **(stdin)**. Once the user hits enter, **read** assigns the value entered by the user to the variable num. Now let's make more sense of this. Update the above code to the following:

```bash
#!/bin/bash

# Ask for a number
read -p "Enter a number: " num

# Print the number
echo "you have entered the number" $num
```

![control-flow](img/4.0.control-flow.png)

Notice how we used the echo command to print the value **(stdout)** of the variable num  to the screen?

![control-flow](img/5.0.control-flow.png)

Since we now have something store in the $num variable, we can use controle flow to deternine what the script executes next.

### if statement

The if statement is used to execute a block of code if a condition is true. It is the most basic control flow statement in shell scripting.

```bash
if [ condition ]; then
    # code to execute if condition is true
fi
```
- **if:** is a keyword that marks the start of the if statement.

- **[ condition ]:** is the condition that is evaluated. It is enclosed in square brackets and is followed by a semicolon.

- **then:** marks the start of the code block to be executed if the condition is true.

- **fi:** marks the end of the if statement.

Now let's bring it into our code

```bash
if [ $num -gt 0 ]; then
    echo "The number is positive."
fi
```

The part above tests if the value in **$num** is greater than 0. If it is, the script will print "The number is positive." Now update the script to the following:

```bash
#!/bin/bash

# Ask for a number
read -p "Enter a number: " num

# Print the number
echo "you have entered the number" $num

# Check if the number is positive, negative, or zero
if [ $num -gt 0 ]; then
    echo "The number is positive."
elif [ $num -lt 0 ]; then
    echo "The number is negative."
else
    echo "The number is zero."
fi
```

![if-else](img/6.0.if-else.png)

Notice the keyword **-gt**. These are called **operators**. It is used within conditional blocks to compare two values. In this case, it is used to compare the value in **$num** with 0. **-gt** means "greater than". 

Run the code and experience the output. Try different numbers and see what happens. 

![if-else](img/7.0.if-else.png)


**Tips:** Always read you shell script line by line to get a sense of what it is doing.

### elif statement

After understanding the if statement, let's understand the elif statement. The elif statement is used to execute a block of code if a condition is true. It is the most basic control flow statement in shell scripting.

```bash
id [condition]; then
    # code to execute if condition is true
elif [condition2]; then
    # code to execute if condition is true
else
    # code to execute if condition is false
fi
```

- **elif:** This keyword is used right after an if or another elif block or statement. It allows you to specify an alternative condition to test if the previous conditions are not met.
- **[condition2]:** This is the condition that is evaluated. It is enclosed in square brackets and is followed by a semicolon.
- **then:** This keyword marks the start of the code block to be executed if the condition is true.
- **fi:** This keyword marks the end of the if statement.

No, let's apply elif to our script to handle a scenerio where the nentered number might be negative.

```bash
#!/bin/bash

# Ask for a number
read -p "Enter a number: " num

# Print the number
echo "you have entered the number" $num

# Check if the number is positive, negative, or zero
if [ $num -gt 0 ]; then
    echo "The number is positive."
elif [ $num -lt 0 ]; then
    echo "The number is negative."
else
    echo "The number is zero."
fi
```

**in this updated version of the script:**

- The **if[$num -gt 0]:then** part checks if **num** is greatere than 0 and prints **"the number is positive"** if it is true.
- If the first condition is not met, the **elif[$num -lt 0]:then** part checks if **num** is less than 0 and prints **"the number is negative"** if it is true.
- If none of the conditions are met, the **else** part prints **"the number is zero"**.
- The **fi** keyword marks the end of the if statement.

![if-else](img/8.0.if-else.png)

## Loops

Moving forward in our journey through Bash scripting, we will be learning about loops. Loops are used to repeat a block of code multiple times. 