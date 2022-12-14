# Provoisioning storage account using Terraform and Azure DevOps pipeline
# Steps
- Install Terraform
- Execute Terraform command locally
- Create Terraform configuration files (real code of implementation)
- Create Azure DevOps project
- Push the configuration file to DevOps project
- Create a build pipeline
- Create release pipeline
- Test the implementation on Azure portal

# Create Terraform configuration file
- create the local directory and open it with VS code
- create a main.tf file 
- Before sending the config file to pipeline, let's test first in terminal:
  - terraform init
  - dir (to see what is created)
  - terraform plan (to study the complete configuration file- to see what is to be created, modified and destroyed)
  - We see the plan: 2 to add, 0 to change, 0 to destroy (now we are ready to implement)
# Create Azure DevOps project
- For actual implementation now log in to azure
  - az login
  - Now to go to devOps portal
    - create a new project (e.g terraform-storage)
# Push the configuation file to Devops project
- from repos push the code from local folder to remote 
# Create Build pipeline
- create new pipeline
- use the classic editor and select Azure Repos Git
- Select template (go to empty job)
- Go to Agent job 1 and change to agent pool and agent specification ![](https://github.com/rabbilbhuiyan/AzureLearning/blob/master/Terraform/Terraform_devOps/hands-on-images/Screenshot%20(572).png)
- save
- Create build configuration file
  - click + of agent job 1 and search for copy files and add it ![](https://github.com/rabbilbhuiyan/AzureLearning/blob/master/Terraform/Terraform_devOps/hands-on-images/Screenshot%20(576).png)
  - similarly search for Publish build artifacts and add it ![](https://github.com/rabbilbhuiyan/AzureLearning/blob/master/Terraform/Terraform_devOps/hands-on-images/Screenshot%20(577).png)
  - click on copy files and fill the specifications
    - In target folder: copy and paste the Path to publsih from publish artifact agent job
    - Source folder: leave empty- by default it will take the files e.g main.tf
    - save and queue
    - You see copy and publish taks is successfull ![](https://github.com/rabbilbhuiyan/AzureLearning/blob/master/Terraform/Terraform_devOps/hands-on-images/Screenshot%20(579).png)
    - You can see one artifactis ready, click and see drop folder and inside that all the files ![](https://github.com/rabbilbhuiyan/AzureLearning/blob/master/Terraform/Terraform_devOps/hands-on-images/Screenshot%20(580).png)
    - Build is successfull

  # Create release pipeline
  - create new pipeline
  - go with empty job and save it
  - add the artifact (to add the drop folder during the build process)
  - Then enable the trigger
  - Then go to stages (there is 1 job and 0 task) ![](https://github.com/rabbilbhuiyan/AzureLearning/blob/master/Terraform/Terraform_devOps/hands-on-images/Screenshot%20(587).png)
  - go to the Agent job and no change required there
  - save 
  - click on + of Agent job 
    - search for terraform tool installer, if there is none then install terraform under your devops organization, then can see to add terraform tool installer
    - add it
    - then add 3 instance of terraform by using + of Agent job ![](https://github.com/rabbilbhuiyan/AzureLearning/blob/master/Terraform/Terraform_devOps/hands-on-images/Screenshot%20(590).png)
    - Go to 1st instance and rename it to Terraform:init
      - give the path of drop folder in configuration directory (by clicking ... dot) ![](https://github.com/rabbilbhuiyan/AzureLearning/blob/master/Terraform/Terraform_devOps/hands-on-images/Screenshot%20(591).png)
      - if you don't find any available azure service connection then have to create the service principal (to get conncection with terrafrom and azure devops)
      - then select resource group, storage account, container- if you don't have those earlier then have to create 
      - for 'key' you can get the variable name from the i sign (terrraform.tfstate)-tfstate is the name of container
  - go to the next task: rename it as Terraform: plan, select command:plan, choose the drop folder for configuration directory, choose azure service connections
  - go to next stage: rename it terraform:apply, same process above, only put additioanl command arguments: -auto-approve
  - save ![](https://github.com/rabbilbhuiyan/AzureLearning/blob/master/Terraform/Terraform_devOps/hands-on-images/Screenshot%20(593).png)
  - Now ready to test: click create release
  - check the release ![](https://github.com/rabbilbhuiyan/AzureLearning/blob/master/Terraform/Terraform_devOps/hands-on-images/Screenshot%20(595).png)
  - the queue is started
  - veiw the Agent job and see everything is succeeded ![](https://github.com/rabbilbhuiyan/AzureLearning/blob/master/Terraform/Terraform_devOps/hands-on-images/Screenshot%20(600).png)
# Test on Azure portal
  - Go to the azure portal and see that the storage account is created
  - Go to resource group and see store-rg is created and under that rabbilstorageaccount is created
  - This hands-on project was inspired by youtube tutorial of [InGeniusYT](https://www.youtube.com/watch?v=Ek6WrBPJd_4&ab_channel=InGeniusYT)
