# Mini Project - Basic Linux Commands

## Linux commands Deep Dive

**Now that you have a client terminal and and have access to our remote server, what next?**

In this project, we will be learning the basic Linux commands and their usage.

for the next coupe of preject we will be learning a lot about Linux commands, therefore, it,s tune to get our hands dirty with the commands.

## What are Linux commands?

## Terminal commands:
1. pwd (print working directory) : print working directory
    ```bash
    	pwd
    ```
2. ls (list) : list files and folders/directories in a directory
    ```bash
    	ls
        #Major flags/arguments/switches/options:
    	ls -l (list in long format)
    	ls -a (list all files including hidden files)
    ```

    ```bash
    what is the differences between flags, options, arguments, switches, operations in linux commands. also are there other of such?
    
    Let me explain these command components in Linux:

    1. Flags/Options/Switches (used interchangeably):
    Single letter, preceded by a single dash (-)
    Modify command behavior
    Examples:
    ls -l (long format)
    ls -a (all files)
    ls -r (reverse order)
    
    #Long Options:
    Full words, preceded by double dashes (--)
    More descriptive
    Examples:
    ls --all (equivalent to -a)
    ls --reverse (equivalent to -r)
    ls --human-readable (equivalent to -h)
    Arguments:
    Data passed to the command
    Usually come after options
    Examples:
    ls Documents (Documents is an argument)
    mkdir newdir (newdir is an argument)
    cp file.txt backup.txt (file.txt and backup.txt are arguments)
    Operations:
    Main action of the command
    Some commands have multiple operations
    Examples:
    git commit (commit operation)
    git push (push operation)
    docker run (run operation)
    Parameters:
    Similar to arguments but often used for configuration
    Can be values that modify the command's behavior
    Examples:
    sleep 5 (5 is a parameter)
    echo "Hello" ("Hello" is a parameter)
    Here's a practical example combining all these:
    bash
    ls -la Documents/ --color=auto
    ls - Command
    -la - Flags (multiple combined)
    Documents/ - Argument
    --color=auto - Long option with parameter
    Other common variations:
    Combined flags: ls -la (same as ls -l -a)
    Positional parameters: cp -r source/ destination/
    Optional parameters: mkdir -p [directory]
    Required parameters: tar -xzf archive.tar.gz The terms are often used interchangeably, but generally:
    Flags/Options/Switches: Modify behavior
    Arguments: Input data
    Operations: Main actions
    Parameters: Configuration values
    ```

3. touch (touch) : create an empty file. eg
    ```bash
     	touch README.md
    ```
4. cat (concatenate) : display the contents of a file. eg
    ```bash
    cat README.md
    ```
5. clear (clear) or CTRL+L: clear the terminal screen
    ```bash
    clear
    ```
6. tail (tail) : display the last 10 lines of a file. eg
    ```bash
    tail README.md
    ```
7. head (head) : display the first 10 lines of a file. eg
    ```bash
    head README.md
    ```
8. which (which) : display the path of a command. eg
    ```bash
    which ls
    ``` 
9. info (info) : display information about a command. eg
    ```bash
    info which
    ```
10. man (manual) : display manual pages for a command. eg
    ```bash
    man ls
    ```
11. mkdir (make directory) : create a directory. eg
    ```bash
    mkdir mydir
    mkdir -p mydir/mydir2
    mkdir -p mydir/mydir3/mydir4
    ```
    