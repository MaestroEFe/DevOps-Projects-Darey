# E-commerce Platform Deployment with Git, Linux and AWS

You have been assigned to develope and e-comerce website for a new online marketplace named "MarketPeak". This platform will feature product listings, a shopping cart, and a user authentication. Your Objective is to utilize Git for version control, develope the website in a Linux environment, and deploy it on an AWS EC2 instance. You can find a suitable website teplate [here](https://www.tooplate.com/) to kickstart your development.

# Tasks
## 1. Implementing Version controle with Git

### 1.1. Initializing Git Repository

- Creating the project directory for 

**"MarketPeak_Ecommerce"**
- Inside this directory, initialize a Git Repository to manage your version controle.

```bash
    mkdir MarketPeak_Ecommerce
    cd MarketPeak_Ecommerce
    git init
```
![git](img/1.0.git.png)

### 1.2. Obtaining an prepareing the E-comerce Template 

Instead of developing the website from scratch, you will use a pre-existing website templatge. This approach allows you focus on the deployment and operational aspects, rather than on web developement. The actual web Developement is done by web/software developers on the project.

- Download the template from [here](https://www.tooplate.com/zip-templates/2137_barista_cafe.zip)

- Unzip the downloaded file and move the contents to the **ecomerce_website** directory.

- Optionally customize the template to a desired color scheme and layout.

### 1.3. Adding the Template to the Git Repository

- Add the template files to the Git repository.

- set your Git global cnfiguration with your username and email

- commit the changes to the repository with a clear discriptive message.

```bash
    git add .
    git config --global user.name "Your Name"
    git config --global user.email "your.email@example.com"
    git commit -m "Add e-commerce template"
```

![git staging and commit](img/1.1.git.png)

    
