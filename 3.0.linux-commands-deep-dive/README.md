# Mini Project - Basic Linux Commands

## Linux commands Deep Dive

**Now that you have a client terminal and and have access to our remote server, what next?**

In this project, we will be learning the basic Linux commands and their usage.

for the next coupe of preject we will be learning a lot about Linux commands, therefore, it,s tune to get our hands dirty with the commands.

## What are Linux commands?
A linux command is a program that performs a specific task. It is a utility/program that runs in the command line interface (CLI). The CLI is a text-based envireonment where you interact with the system by typint commands.

Linux commands are executed by entering text in the terminal and pressing Enter. The text is called a command, and it is executed by the shell, which is a program that interprets the command and runs it.

Linux commands are executed by entering text in the terminal and pressing Enter. These commands enables you to perfom a wide range of tasks, including installing packages, managing users, manipulating files and directories, configuring system settings, and more.

The heneral syntax of a Linux command is as follows:

```bash
command [option(s)/flag(s)/switch(es)] [argument(s)/parameter(s)]
```

where

- command : the name of the command to be executed
- option(s)/flag(s)/switch(es) : optional parameters that modify the behavior of the command
- argument(s)/parameter(s) : required parameters that provide input data to the command

we can write the general syntax of a Linux command as follows for short 

```bash
command [option(s)] [parameter(s)]
```

A command may consits of options and parameters, but they are not always required. here are the key components of a comman:

**Command Name or Operation** : This represents the action or task you want to perform using the command. For example, if you wish to list the files in a foler, the command to call is the `ls` command. The name of the command is `ls` which stands for list.

```bash
	ls
```

![](img/1.0-remote-connection.gif)

**Options/Flags/Switches** : An option or flag or switch, as it may be called, modifies the behaviour of a command. It is typically preceeded by a single dash (-) or double dash (--). The single dash is used for short options, while the double dash is used for long options. it is used to customize the functionality of a command. For example, the `ls` command has a `-l` option that lists files in long format. The long option for this is `--long`.

```bash
	ls -l

    #Long option
    ls --long
```

![](img/1.0-remote-connection.gif)

**Parameters/Arguments** : A parameter or and argument provides specific information or data required by the command to execute the desired action. for example, if i want to create a new directory, (or folder), I will pass use the `mkdir` command. The parameter will be the name of the directory in which I will pass to the command. e.g `mkdir Photo` will create a Photo directory.

```bash
	mkdir Photo
```

![](img/1.0-remote-connection.gif)

**Note:** *It's important to note that Linux commands are case sensitive, so you need to enter them exactly as they are spelled and formatted.*

## Manipulating files and directories on Linux
Most of the time on Linux will be spent working with files and directories. Hence, it is very important to know how to work with them. In the next section, we will docus on different commands that covers different commands that covers different use cases of manipulating files and directories on Linux.

### The `sudo` command
In Linux, some actions need special permissions to be carried out, like creating files in certain areas or changin important system settings. this is where the sudo command comes into play. "sudo" stands for "superuser" or "superuser do" or "superuser execute". It allows you to run  commands with the security privillages of another user, typically the root user.

### Why Use Sudo?

1. **Security**: Sudo provides an additional layer of security by requiring a password before executing a command with elevated privileges. This helps prevent unauthorized access to system resources.
2. **Tracking and Auditability**: Sudo maintains a log of commands executed with elevated privileges, making it easier to track and audit system changes.
3. **Flexibility**: Sudo allows you to grant specific users or groups the ability to execute commands with elevated privileges, without giving them full root access.

### How to Use Sudo?
When you precede a command with sudo, Linux will prompt you for your password before executing the command. Once you enter it correctly, you can run the commands as if you were the system's superuser or root user for a short period (usually 15 minutes depending on the system configuration). This means you won't need to enter your passwrd for each sudo command within this period.

```bash
	sudo <command>
```

### Example
```bash
	sudo apt update
```

### Creating a Folder with Sudo

Sometimes, you need supperuser privillages to create a folder in certain locations on your system. Here is how to do it:

1. Open your terminal and connec to your linux server using ssh.

```bash
	ssh <username>@<ip_address>
```
![](img/1.0-remote-connection.gif)

2. Try creating a folder in a restricted location. For example, let's try to create a folder named `Photo` in the `/root` directory, which is a restricted location for root user.

```bash
	mkdir /root/Photo
```
![](img/1.0-remote-connection.gif)

3. You will get a permission denied error. This is because you don't have the necessary permissions to create a folder in the `/root` directory.

```bash
	mkdir: cannot create directory '/root/Photo': Permission denied
```
![](img/1.0-remote-connection.gif)

This error occurs because regular users do not have the necessary permissions to create a folder in the `/root` directory.

4. To create a folder in a restricted location, you need to use sudo.

```bash
	sudo mkdir /root/Photo
```
![](img/1.0-remote-connection.gif)

Because you now included sudo in the command, it executed successfully and created a folder named `Photo` in the `/root` directory. in some cases, you may be prompted to enter your password. This is because sudo requires authentication before executing commands with elevated privileges.

5. You can verify that the folder was created successfully by using the `ls` command.

```bash
	ls /root
```
![](img/1.0-remote-connection.gif)

**Note:** *You can also use the `sudo -i` command to switch to the root user and then create the folder without using sudo. Sudo -i is a command that switches to the root user and prompts for your password. This is a more secure way to create a folder in a restricted location. Also note that using sudo gives you significant power over your system, including the ability to delete crucial system files. So, it's important to use it with caution.*


### The `pwd` command

The `pwd` command is used to print the current working directory. It is a simple command that returns the path of the directory you are currently in. It uses the following syntax:

```bash
	pwd
```
![](img/1.0-remote-connection.gif)

### The Linux directory structure
After learning about the use of sudo, it's crucial to understand how the linux filesystem is organized. This knowledge is fundamental when navigating througvh the sytem, managing files, and directories, and understanding the location and permissions of different types of files and directories with the system.
The Linus directory structure is as follows:

```bash
	/
	├── bin
	├── boot
	├── dev
	├── etc
	├── home
	├── lib
	├── media
	├── mnt
	├── opt
	├── proc
	├── root
	├── run
	├── sbin
	├── srv
	├── sys
	├── tmp
	├── usr
	└── var
```

![](img/1.0-linux-directory-structure.gif)

#### The Root Directory("/")
At the top of the Linux filesystem hierarchy is the root directory, denoted by a single forward slash ("/"). Unline windows, which uses diffent drives (e.g C:, D:, etc), Linux uses a single root directory to organize all files and directories/folders. Under `/`, you will find various directgories with specific purposes:

- `bin`: Contains binary executable files for system commands and utilities.
- `boot`: Contains files needed for system boot, such as the kernel and initrd.
- `dev`: Represents device files, representing hardware devices.
- `etc`: Stores configuration files for system services and applications.
- `home`: Contains user home directories.
- `lib`: Stores library files, including shared libraries and kernel modules.
- `media`: Mount point for removable media devices.
- `mnt`: Mount point for temporary mount points.
- `opt`: Optional add-on software packages.
- `proc`: Virtual filesystem containing process and kernel information.
- `root`: Home directory for the root user.
- `run`: Runtime files and sockets.
- `sbin`: System binaries for system administration tasks.
- `srv`: Service data files.
- `sys`: Virtual filesystem containing system information.
- `tmp`: Temporary files.
- `usr`: User files, including applications and shared libraries.
- `var`: Variable data files, such as logs and user data.

##### The bin directory
The `bin` directory contains binary executable files for system commands and utilities. These are the files that are used to perform various tasks on the system. For example, the `ls` command is used to list files and directories, and the `pwd` command is used to print the current working directory.









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
    