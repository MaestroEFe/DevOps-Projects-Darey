# Linux Shell Scripting

## Shell Scripting

With the thousands of commands available in Linux, it can be time-consuming to remember and execute each command manually. Shell scripts provide a way to automate and streamline these tasks, making it easier to perform repetitive or complex operations.

### What is a Shell Script?

Imagine you are tasked with setting up new workstations and user accounts regularly at your job. Instead of manually creating each user account and setting up their environment, you can create a shell script to automate this process. A shell script is a file containing a series of Linux commands that can be executed as a single unit. This can save time and reduce the risk of errors. 

Shecll script is athe process of writing a script that can be executed by a shell. . A shell script is essentially a script or program written in a shell language, such as **Bash**, **sh**, **zsh**, **fish** or **PowerShell**

A basic shell script that will create multiple folders and create multiple linux users at once would look like this:

```bash
#!/bin/bash

# Create multiple folders
mkdir folder1 folder2 folder3

# Create multiple users
sudo useradd user1 user2 user3

# Set password for users
sudo passwd user1
sudo passwd user2
sudo passwd user3
```

