@description('Name of the Resource Group')
param resourceGroupName string = 'myResourceGroup'

@description('Location for the Resource Group')
param location string = 'westeurope'

@description('Name of the Storage Account')
param storageAccountName string = 'mystorageaccountdemo123'  // Must be globally unique

resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceGroupName
  location: location
}

resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: storageAccountName
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
  properties: {
    accessTier: 'Hot'
  }
  dependsOn: [
    resourceGroup
  ]
}
