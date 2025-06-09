# Mini Project. Basic Git Command

This is a mini project aimed at understanding documentations and mastering the process incvolved.
## Part 1: Setup and initial configuration
### 1. Install Git:
- Visit the [official Git website](#) and [download](#) the version of git for your operating system. Follow the installation intructions
### 2. Create a GitHub Repository
 - sign up or log into [GitHub](#).
 - click the "+" icon in the top-right coner and select the "New Repository."

 ![Create New Repo](img/1.Create-new-repo.png)
 - Name your repository (e.g., "DevOps-Project-Darey") and initialize it with a README file
 - Click "Create repository"

 ![](img/2.Create-new-repo.png)

### 3. Clone the Repository
- On your repository's page on GitHub, click the "Code" button and copy the HTTPS URL.

 ![](img/3.Clone-repo.png)
 - Open your terminal or command promt
 - Create a foler named *"DevOps"* in the folder where you are storeing all *DAREY.IO and DevOps work* related work. For example in the Desktop or Documents folder of your laptop, you may create a folder called *"darey-training"*.
 - change directory into *"git-project"*

 `cd DevOps-Projects-Darey`

 - Clone (Download) the repository from GitHub using
 
 `git clone [Past the URL copied from GitHub]
`

![git clone](img/4.git-clone.png)
- SInce you just cloned your repository, your brancgh is `main`.
- Navigate into the repostory you just cloned

`cd DevOps-projects-Darey`
- if you are like me, create a new folder for this first project and tag it 1.0.git-project

`cd 1.0.git-project`
- Create an image folder and a new ReadMe.md file for documentation.

![project directory](img/5.Project-directory.png)
- create an empty file *"index.html"*
- Add the content below
- Check the changes has not been staged

`git status`
