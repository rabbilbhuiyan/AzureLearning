# How to deploy react app service into azure app service using Azure devOps
# Steps:
1. Development Environment: Create React application in the local system
2. Push your code in azure repos (DevOps Service)
3. Create a Azure build pipeline : to build react js application
4. Create a app service in Azure: to deploy our application
5. Create a Azure release pipeline: for releasing the react js application into azure

# Create React application
- Open the terminal(cmd) and navigate to the directory folder
- npx create-react-app projectName
- npm start
- This will open the browser on localhost port:3000 (press ctlr+C to stop the terminal) ![](./images/Screenshot%20(569).png)

# Create build pipeline in Azure DevOps
- go to devOps portal
- create your organization and project
- Then push your local code in Azure repos : As we already created the source code, so go to the Push an existing repository from command line
- Make sure you are inside the project folder e.g my-app
- Then copy and paste there
- This will consequently push all the local source codes to remote azure repos ![](./images/Screenshot%20(552).png)
- go to Azure pipeline and create pipeline : 
  - select classic editor
  - Azure Repos Git
  - Empty job (as we don't have any built-in template for react js )![](./images/Screenshot%20(553).png)
    - select windows for the agent
- Agent job 1:
  - search for npm and add npm task for build pipeline ![](./images/Screenshot%20(556).png)
  - add one more npm node :
    -display name it as 'npm build'
    - Command: custom
    - Command and arguments: run build
  - search for 'Publish Pipeline Artifacts' and add it
    - change the Path to publish into 'build'
  - Save and queue (build and run) so that we can see the artifact
  - We see that everyting is executed nicely (no error)- our build is done
  - After building is done we can see one artificat (published)
    - click and see the drop folder where all the react files are downloaded or stored ![](./images/Screenshot%20(555).png)
  - Activate the trigger: go to edit pipeline and enable the trigger option and save only (no run at this time) ![](./images/Screenshot%20(559).png)
# Create azure web app service in Azure
- Before going to Release pipeline we have to set up our azure web app service- where we will deploy our React js application
- login to azure and create a new azure app service
- after creating the app service click the URL- see the default web app provided by azure
- once our release pipeline deploys our code here, the default content will be replaced by our React js page
- move on to the release pipeline area

# Create Release pipeline in Azure DevOps
- create new release pipeline
- Go to stages and select Empty job
  - Stage name: Dev <img src=./images/Screenshot%20(561).png width=400/>
- Go to Artifacts: Build, select build pipeline name (build during the building phase)
- Add
- Enable the automatic trigger option
- go to Dev stage and add new task in Agent job
  - search for Azure web app and add (it will deploy our react js code to the azure web app )
  - choose the subscriptoin where web app is created
  - choose app type: web app on windows
  - select the web app name that we created or type here
  - select package or folder by clicking ... dots and select the drop folder that we created in build pipeline and save

# Verifiy that build and release pipelines are working
- go and make some changes in source code
- open the project folder in VS code and in App.js do some changes
- then commit and push the changes
- Back to the Azure build pipeline
- We see that the build is already triggered as we have made the chnages in azure repo
- Once the build process is completed, immediately the realase pipeline will be triggered
- go to release pipeline and as expected we see that it is trigggered
- let's open the web app (web site) from azure portal: we see the changes in the website. ![](./images/Screenshot%20(567).png){ width=20% }

# CI/CD  pipelines succeeded:
- We did the change in source code and the changes are then automatically deployed to Azure, without any manual interventions: we successfully applied CI/CD pipeline 
- This hands on was inspried by the youtube tutorial by [Techies Lounge](https://www.youtube.com/watch?v=Ny5vJRfQito&ab_channel=TechiesLounge)





