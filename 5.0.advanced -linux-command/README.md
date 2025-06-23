# Advanced Linux Command
## File Permissions and Ownership/Access Rights

Understanding how to manage file permissions and ownership/access rights is crucial for system security and proper file management in Linux. this knowledge empowers you to controle access to files and directories, ensuteing the security and intergrity of your system. Let's explore some essential commands and concepts related to file permissions and ownership.

In Linux, managing file permissions and ownership is vital for controlling who can access, modify, or ececute files directories. Understanding these concepts allows you to maintian the security and intergrity of your system. Let's delve into the key commands and concepts related to file permissions and ownership.

### Numeric Representation of Permissions

In Linux, file permissions are often represented using a numeric system. Each permission type **(no permission, read, write, execute)** is assigned a numeric value:

- No Permission: 0
- Read Permission: 4
- Write Permission: 2
- Execute Permission: 1

These values are combined to represent the permiossions for each user class. Let's see how this works:

### Permissions Represented by 7

- 4 (read permission) + 2 (write permission) + 1 (execute permission) = 7

    - symbolic: rwx
    - Meaning: read, write, execute permission are all granted
    - Example Context: A script file that the owner needs to read, modify, and execute.

### Permissions represented by 6

- 4 (read permission) + 2 (write permission) = 6

    - symbolic: rw-
    - Meaning: read and write permissions are granted, but execute permission is denied.
    - Example Context: A configuration file that the owner needs to read and modify, but not execute.
### Permissions represented by 5

- 4 (read permission) + 1 (execute permission) = 5

    - symbolic: r-x
    - Meaning: read and execute permissions are granted, but write permission is denied.
    - Example Context: A binary file that the owner needs to execute, but not read or modify. such as a shared library file that users can only read and execute but not modify.

## The Role of Hyphen (-) in Permission Representation

When discussing permissions, you might notice hyphens (-) in the permission representation. In the context of Linux file permissions, a hyphen doesn't actually represent a user class. Instead, it's used in the symbolic representation of permissions to show the abscence of a permission.

Lets get a bit practical with examples with running ls -latr command

