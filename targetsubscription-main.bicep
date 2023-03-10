
//New-AzSubscriptionDeployment -Location westeurope -TemplateFile .\main.bicep
targetScope='subscription'

param resourceGroupName string = 'RG-test'
param resourceGroupLocation string = 'westeurope'
param storageName string = 'storagetest3131231'
param storageLocation string = 'westeurope'

resource newRG 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name: resourceGroupName
  location: resourceGroupLocation
}

module storageAcct 'storage.bicep' = {
  name: 'storageModule'
  scope: newRG
  params: {
    storageLocation: storageLocation
    storageName: storageName
  }
}
