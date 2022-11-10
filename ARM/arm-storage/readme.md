# Project set up (documenation link : https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/quickstart-create-templates-use-visual-studio-code?tabs=CLI)
- open the project folder in VS code and add the required extensions: Azure Resource Manager (ARM) Tools for Visual Studio Code - for the intellegence and deployment of template
- also enable ARM Template Viewer extension
# Building template: We will deploy a storage account using ARM template
- First we created a bank template using arm! (with the help of extension)
- Then we created a storage file : 01-storage.json 
  - we expanded the resource section: to create storage resoruces (arm-storage!), added the necessary parameters (documentation link: https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/ or azure quickstart template github: https://github.com/Azure/azure-quickstart-templates)
# Deploying the template using PowerShell (pwsh)
- We used the powershell to connect azure account: Connect-AzAccount
- We can directly deploy from the terminal, however we have created a script for deployment named as 01-storage.ps1
- Then in the pwsh run the script: .\01-storage.ps1
- We found that the deployment is succeeded
# Validation of deployment
- Now go back to azure portal and review the result: refresh the portal and we can see the resource group name and the storage name under it
- At this stage you can configure the storage specification e.g if you want to change the properties (e.g replication), change it, save it and rerun the script; you will see the changes
- Resources: Azure-quickstart-templates
# Parameterization of template
- we need to update our template: e.g naming your resources, to avoid hardcoding we will do the parameterization
- We used 3 parameters: name, sku, location
- We expanded the parameter{} 
    - add the storageName field and other properties ( to see the properties of each filed go to the azure template documentation or )
- Then from the resource{} we deleted the name and added function there [parameters('storagename')]
- Similarly, we parameterized storageSKU and location
- We run all the scripts for each parameterization and validated the deployment by going back to the azure portal
# Deletion of resources
- Finally we run the script file to delete the resources created
