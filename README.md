# AzureDevopsSetup
Step by Step guide to setup Azure Devops pipeline for IaC

Objective - The objective is to automate the deployment of Azure infrastructure using Azure DevOps Pipelines. We will use Terraform (or Bicep) to define our cloud resources as code and deploy them securely.

Prerequisites - 
1. Azure Subscription
2. Azure Devops Account
3. Github Repository (Can use Azure Repos as well)
4. IaC knowledge (Can use Bicep, ARM or Terraform)

Step 1: Set up Azure Devops Project

(1) Signin to Azure Devops - https://dev.azure.com/

(2) Create a new organization and create a new project under it -

![image](https://github.com/user-attachments/assets/d3dca975-ee7d-4e1d-a75a-da8c337deac8)

Step 2: Add Bicep Code to create Azure resources
Add azure bicep code to create a resource group and storage account in your github repo, you can see the code in main.bicep.

Step 3: Connect Azure DevOps to Github
To pull the code from Github, go to the Azure  DevOps project. Go to pipelines --> New Pipeline.
![image](https://github.com/user-attachments/assets/716e0ce1-224a-41ed-80b8-340be3da4585)
After this step, select Github as the code is hosted in Github.
![image](https://github.com/user-attachments/assets/456ea399-be20-4566-9b50-732e4069629f)
It will ask to authorize Azure Pipelines to acess Github --> click Authorize
![image](https://github.com/user-attachments/assets/787eeeea-dd89-4ca5-afdb-f39d6d14b2d5)
![image](https://github.com/user-attachments/assets/b1f82cd5-6a23-40ef-ac90-a790df15f6c4)

Step 4: Create Pipleine YAML (Simple)
Choose Starter Pipeline
![image](https://github.com/user-attachments/assets/36eeb086-2229-4d62-8f24-3d5324b69d46)
Replace the given code with the below code:
trigger:
- main

pool:
  vmImage: 'ubuntu-latest'

steps:
- task: AzureCLI@2
  inputs:
    azureSubscription: '<Your Azure Service Connection Name>'
    scriptType: 'bash'
    scriptLocation: 'inlineScript'
    inlineScript: |
      az group create --name myNewResourceGroup --location eastus
    displayName: 'Create Azure Resource Group'
It is important to remember to replace <Your Azure Service Connection Name> in the YAML.
![image](https://github.com/user-attachments/assets/59da1706-0077-4604-a8c2-24cead53bf16)
![image](https://github.com/user-attachments/assets/1ede307a-09de-430c-9284-7cb3cf2991f2)
![image](https://github.com/user-attachments/assets/d5c6eeb6-ef4f-4324-92f9-803ea9d9a802)

  Step 5: Create Azure Service Connection
  Azure DevOps needs permission to create resources in Azure and we can do this by creating a Service Connection.
  In the Azure Devops, go to Project Settings --> Service Connections.
   ![image](https://github.com/user-attachments/assets/da72bec3-82b7-426f-a53a-8b7320272faa)
Click New Service Connection --> Choose Azure Resource Manager --> Next
![image](https://github.com/user-attachments/assets/710d4b73-a9a0-4cbb-b86d-08b0f36ccffa)
Select Identity Type (automatic) --> Next.
Give a name to the Service Connection Name
Click Save.
![image](https://github.com/user-attachments/assets/cb4b6497-e200-4e9a-8e9d-068456421ea2)

Step 8: Run the Pipeline
Go back to Pipelines and click Run Pipeline.
