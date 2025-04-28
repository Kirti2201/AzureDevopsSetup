# AzureDevopsSetup
Step by Step guide to setup Azure Devops pipeline for IaC

Objective - The objective is to automate the deployment of Azure infrastructure using Azure DevOps Pipelines. We will use Terraform (or Bicep) to define our cloud resources as code and deploy them securely.

Prerequisites - 
1. Azure Subscription
2. Azure Devops Account
3. Github Repository (Can use Azure Repos as well)
4. IaC knowledge (Can use Bicep, ARM or Terraform)

Step 1: Setup Azure Devops Project
Signin to Azure Devops - https://dev.azure.com/
   Create a new organization and create a new project under it -

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
