# Azure CLI workloads Extension #
This is the extension for workloads

### How to use ###
Install this extension using the below CLI command
```
az extension add --name workloads
```

### Included Features ###
#### workloads ####
##### Sap-availability-zone-detail #####
```
az workloads sap-availability-zone-detail --app-location "eastus" --database-type "HANA" --sap-product "S4HANA" \
    --location "centralus" 
```
##### Sap-availability-zone-detail #####
```
az workloads sap-availability-zone-detail --app-location "northeurope" --database-type "HANA" --sap-product "S4HANA" \
    --location "centralus" 
```
##### Sap-disk-configuration #####
```
az workloads sap-disk-configuration --app-location "eastus" --database-type "HANA" --db-vm-sku "Standard_M32ts" \
    --deployment-type "SingleServer" --environment "NonProd" --sap-product "S4HANA" --location "centralus" 
```
##### Sap-disk-configuration #####
```
az workloads sap-disk-configuration --app-location "eastus" --database-type "HANA" --db-vm-sku "Standard_M32ts" \
    --deployment-type "ThreeTier" --environment "Prod" --sap-product "S4HANA" --location "centralus" 
```
##### Sap-sizing-recommendation #####
```
az workloads sap-sizing-recommendation --app-location "eastus" --database-type "HANA" --db-memory 1024 \
    --deployment-type "ThreeTier" --environment "Prod" --sap-product "S4HANA" --saps 20000 --location "centralus" 
```
##### Sap-sizing-recommendation #####
```
az workloads sap-sizing-recommendation --app-location "eastus" --database-type "HANA" --db-memory 1024 \
    --deployment-type "ThreeTier" --environment "Prod" --high-availability-type "AvailabilitySet" \
    --sap-product "S4HANA" --saps 75000 --location "centralus" 
```
##### Sap-sizing-recommendation #####
```
az workloads sap-sizing-recommendation --app-location "eastus" --database-type "HANA" --db-memory 1024 \
    --deployment-type "ThreeTier" --environment "Prod" --high-availability-type "AvailabilityZone" \
    --sap-product "S4HANA" --saps 75000 --location "centralus" 
```
##### Sap-sizing-recommendation #####
```
az workloads sap-sizing-recommendation --app-location "eastus" --database-type "HANA" --db-memory 2000 \
    --deployment-type "SingleServer" --environment "NonProd" --sap-product "S4HANA" --saps 60000 \
    --location "centralus" 
```
##### Sap-supported-sku #####
```
az workloads sap-supported-sku --app-location "eastus" --database-type "HANA" --deployment-type "ThreeTier" \
    --environment "Prod" --sap-product "S4HANA" --location "centralus" 
```
##### Sap-supported-sku #####
```
az workloads sap-supported-sku --app-location "eastus" --database-type "HANA" --deployment-type "ThreeTier" \
    --environment "Prod" --high-availability-type "AvailabilitySet" --sap-product "S4HANA" --location "centralus" 
```
##### Sap-supported-sku #####
```
az workloads sap-supported-sku --app-location "eastus" --database-type "HANA" --deployment-type "ThreeTier" \
    --environment "Prod" --high-availability-type "AvailabilityZone" --sap-product "S4HANA" --location "centralus" 
```
##### Sap-supported-sku #####
```
az workloads sap-supported-sku --app-location "eastus" --database-type "HANA" --deployment-type "SingleServer" \
    --environment "NonProd" --sap-product "S4HANA" --location "centralus" 
```
#### workloads sap-virtual-instance ####
##### Create #####
```
az workloads sap-virtual-instance create --location "westcentralus" \
    --configuration "{\\"appLocation\\":\\"eastus\\",\\"configurationType\\":\\"Deployment\\",\\"infrastructureConfiguration\\":{\\"appResourceGroup\\":\\"X00-RG\\",\\"applicationServer\\":{\\"instanceCount\\":6,\\"subnetId\\":\\"/subscriptions/49d64d54-e966-4c46-a868-1999802b762c/resourceGroups/dindurkhya-e2etesting/providers/Microsoft.Networks/virtualNetworks/test-vnet/subnets/appsubnet\\",\\"virtualMachineConfiguration\\":{\\"imageReference\\":{\\"offer\\":\\"RHEL-SAP\\",\\"publisher\\":\\"RedHat\\",\\"sku\\":\\"7.4\\",\\"version\\":\\"7.4.2019062505\\"},\\"osProfile\\":{\\"adminUsername\\":\\"{your-username}\\",\\"osConfiguration\\":{\\"disablePasswordAuthentication\\":true,\\"osType\\":\\"Linux\\",\\"ssh\\":{\\"publicKeys\\":[{\\"keyData\\":\\"ssh-rsa public key\\"}]}}},\\"vmSize\\":\\"Standard_E32ds_v4\\"}},\\"centralServer\\":{\\"instanceCount\\":1,\\"subnetId\\":\\"/subscriptions/49d64d54-e966-4c46-a868-1999802b762c/resourceGroups/dindurkhya-e2etesting/providers/Microsoft.Networks/virtualNetworks/test-vnet/subnets/appsubnet\\",\\"virtualMachineConfiguration\\":{\\"imageReference\\":{\\"offer\\":\\"RHEL-SAP\\",\\"publisher\\":\\"RedHat\\",\\"sku\\":\\"7.4\\",\\"version\\":\\"7.4.2019062505\\"},\\"osProfile\\":{\\"adminUsername\\":\\"{your-username}\\",\\"osConfiguration\\":{\\"disablePasswordAuthentication\\":true,\\"osType\\":\\"Linux\\",\\"ssh\\":{\\"publicKeys\\":[{\\"keyData\\":\\"ssh-rsa public key\\"}]}}},\\"vmSize\\":\\"Standard_E16ds_v4\\"}},\\"databaseServer\\":{\\"databaseType\\":\\"HANA\\",\\"instanceCount\\":1,\\"subnetId\\":\\"/subscriptions/49d64d54-e966-4c46-a868-1999802b762c/resourceGroups/dindurkhya-e2etesting/providers/Microsoft.Networks/virtualNetworks/test-vnet/subnets/dbsubnet\\",\\"virtualMachineConfiguration\\":{\\"imageReference\\":{\\"offer\\":\\"RHEL-SAP\\",\\"publisher\\":\\"RedHat\\",\\"sku\\":\\"7.4\\",\\"version\\":\\"7.4.2019062505\\"},\\"osProfile\\":{\\"adminUsername\\":\\"{your-username}\\",\\"osConfiguration\\":{\\"disablePasswordAuthentication\\":true,\\"osType\\":\\"Linux\\",\\"ssh\\":{\\"publicKeys\\":[{\\"keyData\\":\\"ssh-rsa public key\\"}]}}},\\"vmSize\\":\\"Standard_M32ts\\"}},\\"deploymentType\\":\\"ThreeTier\\"}}" \
    --environment "Prod" --sap-product "S4HANA" --resource-group "test-rg" --sap-virtual-instance-name "X00" 

az workloads sap-virtual-instance wait --created --resource-group "{rg}" \
    --sap-virtual-instance-name "{mySapVirtualInstance}" 
```
##### Create #####
```
az workloads sap-virtual-instance create --location "westcentralus" \
    --configuration "{\\"appLocation\\":\\"eastus\\",\\"configurationType\\":\\"Deployment\\",\\"infrastructureConfiguration\\":{\\"appResourceGroup\\":\\"X00-RG\\",\\"applicationServer\\":{\\"instanceCount\\":5,\\"subnetId\\":\\"/subscriptions/49d64d54-e966-4c46-a868-1999802b762c/resourceGroups/dindurkhya-e2etesting/providers/Microsoft.Networks/virtualNetworks/test-vnet/subnets/appsubnet\\",\\"virtualMachineConfiguration\\":{\\"imageReference\\":{\\"offer\\":\\"RHEL-SAP\\",\\"publisher\\":\\"RedHat\\",\\"sku\\":\\"7.4\\",\\"version\\":\\"7.4.2019062505\\"},\\"osProfile\\":{\\"adminUsername\\":\\"{your-username}\\",\\"osConfiguration\\":{\\"disablePasswordAuthentication\\":true,\\"osType\\":\\"Linux\\",\\"ssh\\":{\\"publicKeys\\":[{\\"keyData\\":\\"ssh-rsa public key\\"}]}}},\\"vmSize\\":\\"Standard_E32ds_v4\\"}},\\"centralServer\\":{\\"instanceCount\\":2,\\"subnetId\\":\\"/subscriptions/49d64d54-e966-4c46-a868-1999802b762c/resourceGroups/dindurkhya-e2etesting/providers/Microsoft.Networks/virtualNetworks/test-vnet/subnets/appsubnet\\",\\"virtualMachineConfiguration\\":{\\"imageReference\\":{\\"offer\\":\\"RHEL-SAP\\",\\"publisher\\":\\"RedHat\\",\\"sku\\":\\"7.4\\",\\"version\\":\\"7.4.2019062505\\"},\\"osProfile\\":{\\"adminUsername\\":\\"{your-username}\\",\\"osConfiguration\\":{\\"disablePasswordAuthentication\\":true,\\"osType\\":\\"Linux\\",\\"ssh\\":{\\"publicKeys\\":[{\\"keyData\\":\\"ssh-rsa public key\\"}]}}},\\"vmSize\\":\\"Standard_E16ds_v4\\"}},\\"databaseServer\\":{\\"databaseType\\":\\"HANA\\",\\"instanceCount\\":2,\\"subnetId\\":\\"/subscriptions/49d64d54-e966-4c46-a868-1999802b762c/resourceGroups/dindurkhya-e2etesting/providers/Microsoft.Networks/virtualNetworks/test-vnet/subnets/dbsubnet\\",\\"virtualMachineConfiguration\\":{\\"imageReference\\":{\\"offer\\":\\"RHEL-SAP\\",\\"publisher\\":\\"RedHat\\",\\"sku\\":\\"7.4\\",\\"version\\":\\"7.4.2019062505\\"},\\"osProfile\\":{\\"adminUsername\\":\\"{your-username}\\",\\"osConfiguration\\":{\\"disablePasswordAuthentication\\":true,\\"osType\\":\\"Linux\\",\\"ssh\\":{\\"publicKeys\\":[{\\"keyData\\":\\"ssh-rsa public key\\"}]}}},\\"vmSize\\":\\"Standard_M32ts\\"}},\\"deploymentType\\":\\"ThreeTier\\",\\"highAvailabilityConfig\\":{\\"highAvailabilityType\\":\\"AvailabilitySet\\"}}}" \
    --environment "Prod" --sap-product "S4HANA" --resource-group "test-rg" --sap-virtual-instance-name "X00" 

az workloads sap-virtual-instance wait --created --resource-group "{rg}" \
    --sap-virtual-instance-name "{mySapVirtualInstance}" 
```
##### Create #####
```
az workloads sap-virtual-instance create --location "westcentralus" \
    --configuration "{\\"appLocation\\":\\"eastus\\",\\"configurationType\\":\\"Deployment\\",\\"infrastructureConfiguration\\":{\\"appResourceGroup\\":\\"X00-RG\\",\\"applicationServer\\":{\\"instanceCount\\":6,\\"subnetId\\":\\"/subscriptions/49d64d54-e966-4c46-a868-1999802b762c/resourceGroups/dindurkhya-e2etesting/providers/Microsoft.Networks/virtualNetworks/test-vnet/subnets/appsubnet\\",\\"virtualMachineConfiguration\\":{\\"imageReference\\":{\\"offer\\":\\"RHEL-SAP\\",\\"publisher\\":\\"RedHat\\",\\"sku\\":\\"7.4\\",\\"version\\":\\"7.4.2019062505\\"},\\"osProfile\\":{\\"adminUsername\\":\\"{your-username}\\",\\"osConfiguration\\":{\\"disablePasswordAuthentication\\":true,\\"osType\\":\\"Linux\\",\\"ssh\\":{\\"publicKeys\\":[{\\"keyData\\":\\"ssh-rsa public key\\"}]}}},\\"vmSize\\":\\"Standard_E32ds_v4\\"}},\\"centralServer\\":{\\"instanceCount\\":2,\\"subnetId\\":\\"/subscriptions/49d64d54-e966-4c46-a868-1999802b762c/resourceGroups/dindurkhya-e2etesting/providers/Microsoft.Networks/virtualNetworks/test-vnet/subnets/appsubnet\\",\\"virtualMachineConfiguration\\":{\\"imageReference\\":{\\"offer\\":\\"RHEL-SAP\\",\\"publisher\\":\\"RedHat\\",\\"sku\\":\\"7.4\\",\\"version\\":\\"7.4.2019062505\\"},\\"osProfile\\":{\\"adminUsername\\":\\"{your-username}\\",\\"osConfiguration\\":{\\"disablePasswordAuthentication\\":true,\\"osType\\":\\"Linux\\",\\"ssh\\":{\\"publicKeys\\":[{\\"keyData\\":\\"ssh-rsa public key\\"}]}}},\\"vmSize\\":\\"Standard_E16ds_v4\\"}},\\"databaseServer\\":{\\"databaseType\\":\\"HANA\\",\\"instanceCount\\":2,\\"subnetId\\":\\"/subscriptions/49d64d54-e966-4c46-a868-1999802b762c/resourceGroups/dindurkhya-e2etesting/providers/Microsoft.Networks/virtualNetworks/test-vnet/subnets/dbsubnet\\",\\"virtualMachineConfiguration\\":{\\"imageReference\\":{\\"offer\\":\\"RHEL-SAP\\",\\"publisher\\":\\"RedHat\\",\\"sku\\":\\"7.4\\",\\"version\\":\\"7.4.2019062505\\"},\\"osProfile\\":{\\"adminUsername\\":\\"{your-username}\\",\\"osConfiguration\\":{\\"disablePasswordAuthentication\\":true,\\"osType\\":\\"Linux\\",\\"ssh\\":{\\"publicKeys\\":[{\\"keyData\\":\\"ssh-rsa public key\\"}]}}},\\"vmSize\\":\\"Standard_M32ts\\"}},\\"deploymentType\\":\\"ThreeTier\\",\\"highAvailabilityConfig\\":{\\"highAvailabilityType\\":\\"AvailabilityZone\\"}}}" \
    --environment "Prod" --sap-product "S4HANA" --resource-group "test-rg" --sap-virtual-instance-name "X00" 

az workloads sap-virtual-instance wait --created --resource-group "{rg}" \
    --sap-virtual-instance-name "{mySapVirtualInstance}" 
```
##### Create #####
```
az workloads sap-virtual-instance create --location "westcentralus" \
    --configuration "{\\"appLocation\\":\\"eastus\\",\\"configurationType\\":\\"Deployment\\",\\"infrastructureConfiguration\\":{\\"appResourceGroup\\":\\"X00-RG\\",\\"databaseType\\":\\"HANA\\",\\"deploymentType\\":\\"SingleServer\\",\\"networkConfiguration\\":{\\"isSecondaryIpEnabled\\":true},\\"subnetId\\":\\"/subscriptions/49d64d54-e966-4c46-a868-1999802b762c/resourceGroups/dindurkhya-e2etesting/providers/Microsoft.Networks/virtualNetworks/test-vnet/subnets/appsubnet\\",\\"virtualMachineConfiguration\\":{\\"imageReference\\":{\\"offer\\":\\"RHEL-SAP\\",\\"publisher\\":\\"RedHat\\",\\"sku\\":\\"7.4\\",\\"version\\":\\"7.4.2019062505\\"},\\"osProfile\\":{\\"adminUsername\\":\\"{your-username}\\",\\"osConfiguration\\":{\\"disablePasswordAuthentication\\":true,\\"osType\\":\\"Linux\\",\\"ssh\\":{\\"publicKeys\\":[{\\"keyData\\":\\"ssh-rsa public key\\"}]}}},\\"vmSize\\":\\"Standard_E32ds_v4\\"}}}" \
    --environment "NonProd" --sap-product "S4HANA" --resource-group "test-rg" --sap-virtual-instance-name "X00" 

az workloads sap-virtual-instance wait --created --resource-group "{rg}" \
    --sap-virtual-instance-name "{mySapVirtualInstance}" 
```
##### Create #####
```
az workloads sap-virtual-instance create --location "westcentralus" \
    --configuration "{\\"appLocation\\":\\"eastus\\",\\"configurationType\\":\\"DeploymentWithOSConfig\\",\\"infrastructureConfiguration\\":{\\"appResourceGroup\\":\\"X00-RG\\",\\"applicationServer\\":{\\"instanceCount\\":6,\\"subnetId\\":\\"/subscriptions/49d64d54-e966-4c46-a868-1999802b762c/resourceGroups/dindurkhya-e2etesting/providers/Microsoft.Networks/virtualNetworks/test-vnet/subnets/appsubnet\\",\\"virtualMachineConfiguration\\":{\\"imageReference\\":{\\"offer\\":\\"RHEL-SAP\\",\\"publisher\\":\\"RedHat\\",\\"sku\\":\\"7.4\\",\\"version\\":\\"7.4.2019062505\\"},\\"osProfile\\":{\\"adminUsername\\":\\"{your-username}\\",\\"osConfiguration\\":{\\"disablePasswordAuthentication\\":true,\\"osType\\":\\"Linux\\",\\"sshKeyPair\\":{\\"privateKey\\":\\"xyz\\",\\"publicKey\\":\\"abc\\"}}},\\"vmSize\\":\\"Standard_E32ds_v4\\"}},\\"centralServer\\":{\\"instanceCount\\":1,\\"subnetId\\":\\"/subscriptions/49d64d54-e966-4c46-a868-1999802b762c/resourceGroups/dindurkhya-e2etesting/providers/Microsoft.Networks/virtualNetworks/test-vnet/subnets/appsubnet\\",\\"virtualMachineConfiguration\\":{\\"imageReference\\":{\\"offer\\":\\"RHEL-SAP\\",\\"publisher\\":\\"RedHat\\",\\"sku\\":\\"7.4\\",\\"version\\":\\"7.4.2019062505\\"},\\"osProfile\\":{\\"adminUsername\\":\\"{your-username}\\",\\"osConfiguration\\":{\\"disablePasswordAuthentication\\":true,\\"osType\\":\\"Linux\\",\\"sshKeyPair\\":{\\"privateKey\\":\\"xyz\\",\\"publicKey\\":\\"abc\\"}}},\\"vmSize\\":\\"Standard_E16ds_v4\\"}},\\"databaseServer\\":{\\"databaseType\\":\\"HANA\\",\\"instanceCount\\":1,\\"subnetId\\":\\"/subscriptions/49d64d54-e966-4c46-a868-1999802b762c/resourceGroups/dindurkhya-e2etesting/providers/Microsoft.Networks/virtualNetworks/test-vnet/subnets/dbsubnet\\",\\"virtualMachineConfiguration\\":{\\"imageReference\\":{\\"offer\\":\\"RHEL-SAP\\",\\"publisher\\":\\"RedHat\\",\\"sku\\":\\"7.4\\",\\"version\\":\\"7.4.2019062505\\"},\\"osProfile\\":{\\"adminUsername\\":\\"{your-username}\\",\\"osConfiguration\\":{\\"disablePasswordAuthentication\\":true,\\"osType\\":\\"Linux\\",\\"sshKeyPair\\":{\\"privateKey\\":\\"xyz\\",\\"publicKey\\":\\"abc\\"}}},\\"vmSize\\":\\"Standard_M32ts\\"}},\\"deploymentType\\":\\"ThreeTier\\"},\\"osSapConfiguration\\":{\\"deployerVmPackages\\":{\\"storageAccountId\\":\\"/subscriptions/49d64d54-e966-4c46-a868-1999802b762c/resourceGroups/yb-SapInstall/providers/Microsoft.Storage/storageAccounts/ybteststorageaccount\\",\\"url\\":\\"https://ybteststorageaccount.blob.core.windows.net/sapbits/deployervmpackages/DeployerVMPackages.zip\\"},\\"sapFqdn\\":\\"xyz.test.com\\"}}" \
    --environment "Prod" --sap-product "S4HANA" --resource-group "test-rg" --sap-virtual-instance-name "X00" 

az workloads sap-virtual-instance wait --created --resource-group "{rg}" \
    --sap-virtual-instance-name "{mySapVirtualInstance}" 
```
##### Create #####
```
az workloads sap-virtual-instance create --location "westcentralus" \
    --configuration "{\\"appLocation\\":\\"eastus\\",\\"configurationType\\":\\"DeploymentWithOSConfig\\",\\"infrastructureConfiguration\\":{\\"appResourceGroup\\":\\"X00-RG\\",\\"applicationServer\\":{\\"instanceCount\\":6,\\"subnetId\\":\\"/subscriptions/49d64d54-e966-4c46-a868-1999802b762c/resourceGroups/dindurkhya-e2etesting/providers/Microsoft.Networks/virtualNetworks/test-vnet/subnets/appsubnet\\",\\"virtualMachineConfiguration\\":{\\"imageReference\\":{\\"offer\\":\\"RHEL-SAP\\",\\"publisher\\":\\"RedHat\\",\\"sku\\":\\"7.4\\",\\"version\\":\\"7.4.2019062505\\"},\\"osProfile\\":{\\"adminUsername\\":\\"{your-username}\\",\\"osConfiguration\\":{\\"disablePasswordAuthentication\\":true,\\"osType\\":\\"Linux\\",\\"sshKeyPair\\":{\\"privateKey\\":\\"xyz\\",\\"publicKey\\":\\"abc\\"}}},\\"vmSize\\":\\"Standard_E32ds_v4\\"}},\\"centralServer\\":{\\"instanceCount\\":2,\\"subnetId\\":\\"/subscriptions/49d64d54-e966-4c46-a868-1999802b762c/resourceGroups/dindurkhya-e2etesting/providers/Microsoft.Networks/virtualNetworks/test-vnet/subnets/appsubnet\\",\\"virtualMachineConfiguration\\":{\\"imageReference\\":{\\"offer\\":\\"RHEL-SAP\\",\\"publisher\\":\\"RedHat\\",\\"sku\\":\\"7.4\\",\\"version\\":\\"7.4.2019062505\\"},\\"osProfile\\":{\\"adminUsername\\":\\"{your-username}\\",\\"osConfiguration\\":{\\"disablePasswordAuthentication\\":true,\\"osType\\":\\"Linux\\",\\"sshKeyPair\\":{\\"privateKey\\":\\"xyz\\",\\"publicKey\\":\\"abc\\"}}},\\"vmSize\\":\\"Standard_E16ds_v4\\"}},\\"databaseServer\\":{\\"databaseType\\":\\"HANA\\",\\"instanceCount\\":2,\\"subnetId\\":\\"/subscriptions/49d64d54-e966-4c46-a868-1999802b762c/resourceGroups/dindurkhya-e2etesting/providers/Microsoft.Networks/virtualNetworks/test-vnet/subnets/dbsubnet\\",\\"virtualMachineConfiguration\\":{\\"imageReference\\":{\\"offer\\":\\"RHEL-SAP\\",\\"publisher\\":\\"RedHat\\",\\"sku\\":\\"7.4\\",\\"version\\":\\"7.4.2019062505\\"},\\"osProfile\\":{\\"adminUsername\\":\\"{your-username}\\",\\"osConfiguration\\":{\\"disablePasswordAuthentication\\":true,\\"osType\\":\\"Linux\\",\\"sshKeyPair\\":{\\"privateKey\\":\\"xyz\\",\\"publicKey\\":\\"abc\\"}}},\\"vmSize\\":\\"Standard_M32ts\\"}},\\"deploymentType\\":\\"ThreeTier\\",\\"highAvailabilityConfig\\":{\\"highAvailabilityType\\":\\"AvailabilitySet\\"}},\\"osSapConfiguration\\":{\\"deployerVmPackages\\":{\\"storageAccountId\\":\\"/subscriptions/49d64d54-e966-4c46-a868-1999802b762c/resourceGroups/yb-SapInstall/providers/Microsoft.Storage/storageAccounts/ybteststorageaccount\\",\\"url\\":\\"https://ybteststorageaccount.blob.core.windows.net/sapbits/deployervmpackages/DeployerVMPackages.zip\\"},\\"sapFqdn\\":\\"xyz.test.com\\"}}" \
    --environment "Prod" --sap-product "S4HANA" --resource-group "test-rg" --sap-virtual-instance-name "X00" 

az workloads sap-virtual-instance wait --created --resource-group "{rg}" \
    --sap-virtual-instance-name "{mySapVirtualInstance}" 
```
##### Create #####
```
az workloads sap-virtual-instance create --location "westcentralus" \
    --configuration "{\\"appLocation\\":\\"eastus\\",\\"configurationType\\":\\"DeploymentWithOSConfig\\",\\"infrastructureConfiguration\\":{\\"appResourceGroup\\":\\"X00-RG\\",\\"applicationServer\\":{\\"instanceCount\\":6,\\"subnetId\\":\\"/subscriptions/49d64d54-e966-4c46-a868-1999802b762c/resourceGroups/dindurkhya-e2etesting/providers/Microsoft.Networks/virtualNetworks/test-vnet/subnets/appsubnet\\",\\"virtualMachineConfiguration\\":{\\"imageReference\\":{\\"offer\\":\\"RHEL-SAP\\",\\"publisher\\":\\"RedHat\\",\\"sku\\":\\"7.4\\",\\"version\\":\\"7.4.2019062505\\"},\\"osProfile\\":{\\"adminUsername\\":\\"{your-username}\\",\\"osConfiguration\\":{\\"disablePasswordAuthentication\\":true,\\"osType\\":\\"Linux\\",\\"sshKeyPair\\":{\\"privateKey\\":\\"xyz\\",\\"publicKey\\":\\"abc\\"}}},\\"vmSize\\":\\"Standard_E32ds_v4\\"}},\\"centralServer\\":{\\"instanceCount\\":2,\\"subnetId\\":\\"/subscriptions/49d64d54-e966-4c46-a868-1999802b762c/resourceGroups/dindurkhya-e2etesting/providers/Microsoft.Networks/virtualNetworks/test-vnet/subnets/appsubnet\\",\\"virtualMachineConfiguration\\":{\\"imageReference\\":{\\"offer\\":\\"RHEL-SAP\\",\\"publisher\\":\\"RedHat\\",\\"sku\\":\\"7.4\\",\\"version\\":\\"7.4.2019062505\\"},\\"osProfile\\":{\\"adminUsername\\":\\"{your-username}\\",\\"osConfiguration\\":{\\"disablePasswordAuthentication\\":true,\\"osType\\":\\"Linux\\",\\"sshKeyPair\\":{\\"privateKey\\":\\"xyz\\",\\"publicKey\\":\\"abc\\"}}},\\"vmSize\\":\\"Standard_E16ds_v4\\"}},\\"databaseServer\\":{\\"databaseType\\":\\"HANA\\",\\"instanceCount\\":2,\\"subnetId\\":\\"/subscriptions/49d64d54-e966-4c46-a868-1999802b762c/resourceGroups/dindurkhya-e2etesting/providers/Microsoft.Networks/virtualNetworks/test-vnet/subnets/dbsubnet\\",\\"virtualMachineConfiguration\\":{\\"imageReference\\":{\\"offer\\":\\"RHEL-SAP\\",\\"publisher\\":\\"RedHat\\",\\"sku\\":\\"7.4\\",\\"version\\":\\"7.4.2019062505\\"},\\"osProfile\\":{\\"adminUsername\\":\\"{your-username}\\",\\"osConfiguration\\":{\\"disablePasswordAuthentication\\":true,\\"osType\\":\\"Linux\\",\\"sshKeyPair\\":{\\"privateKey\\":\\"xyz\\",\\"publicKey\\":\\"abc\\"}}},\\"vmSize\\":\\"Standard_M32ts\\"}},\\"deploymentType\\":\\"ThreeTier\\",\\"highAvailabilityConfig\\":{\\"highAvailabilityType\\":\\"AvailabilityZone\\"}},\\"osSapConfiguration\\":{\\"deployerVmPackages\\":{\\"storageAccountId\\":\\"/subscriptions/49d64d54-e966-4c46-a868-1999802b762c/resourceGroups/yb-SapInstall/providers/Microsoft.Storage/storageAccounts/ybteststorageaccount\\",\\"url\\":\\"https://ybteststorageaccount.blob.core.windows.net/sapbits/deployervmpackages/DeployerVMPackages.zip\\"},\\"sapFqdn\\":\\"xyz.test.com\\"}}" \
    --environment "Prod" --sap-product "S4HANA" --resource-group "test-rg" --sap-virtual-instance-name "X00" 

az workloads sap-virtual-instance wait --created --resource-group "{rg}" \
    --sap-virtual-instance-name "{mySapVirtualInstance}" 
```
##### Create #####
```
az workloads sap-virtual-instance create --location "westcentralus" \
    --configuration "{\\"appLocation\\":\\"eastus\\",\\"configurationType\\":\\"DeploymentWithOSConfig\\",\\"infrastructureConfiguration\\":{\\"appResourceGroup\\":\\"X00-RG\\",\\"databaseType\\":\\"HANA\\",\\"deploymentType\\":\\"SingleServer\\",\\"networkConfiguration\\":{\\"isSecondaryIpEnabled\\":true},\\"subnetId\\":\\"/subscriptions/49d64d54-e966-4c46-a868-1999802b762c/resourceGroups/dindurkhya-e2etesting/providers/Microsoft.Networks/virtualNetworks/test-vnet/subnets/appsubnet\\",\\"virtualMachineConfiguration\\":{\\"imageReference\\":{\\"offer\\":\\"RHEL-SAP\\",\\"publisher\\":\\"RedHat\\",\\"sku\\":\\"7.4\\",\\"version\\":\\"7.4.2019062505\\"},\\"osProfile\\":{\\"adminUsername\\":\\"{your-username}\\",\\"osConfiguration\\":{\\"disablePasswordAuthentication\\":true,\\"osType\\":\\"Linux\\",\\"sshKeyPair\\":{\\"privateKey\\":\\"xyz\\",\\"publicKey\\":\\"abc\\"}}},\\"vmSize\\":\\"Standard_E32ds_v4\\"}},\\"osSapConfiguration\\":{\\"deployerVmPackages\\":{\\"storageAccountId\\":\\"/subscriptions/49d64d54-e966-4c46-a868-1999802b762c/resourceGroups/yb-SapInstall/providers/Microsoft.Storage/storageAccounts/ybteststorageaccount\\",\\"url\\":\\"https://ybteststorageaccount.blob.core.windows.net/sapbits/deployervmpackages/DeployerVMPackages.zip\\"},\\"sapFqdn\\":\\"xyz.test.com\\"}}" \
    --environment "NonProd" --sap-product "S4HANA" --resource-group "test-rg" --sap-virtual-instance-name "X00" 

az workloads sap-virtual-instance wait --created --resource-group "{rg}" \
    --sap-virtual-instance-name "{mySapVirtualInstance}" 
```
##### List #####
```
az workloads sap-virtual-instance list --resource-group "test-rg"
```
##### Show #####
```
az workloads sap-virtual-instance show --resource-group "test-rg" --name "X00"
```
##### Update #####
```
az workloads sap-virtual-instance update --type "None" --tags key1="svi1" --resource-group "test-rg" --name "X00"
```
##### Start #####
```
az workloads sap-virtual-instance start --resource-group "test-rg" --name "X00"
```
##### Stop #####
```
az workloads sap-virtual-instance stop --hard-stop false --resource-group "test-rg" --name "X00"
```
##### Delete #####
```
az workloads sap-virtual-instance delete --resource-group "test-rg" --name "X00"
```
#### workloads sap-central-instance ####
##### Create #####
```
az workloads sap-central-instance create --location "westcentralus" --central-instance-name "centralServer" \
    --resource-group "test-rg" --sap-virtual-instance-name "X00" 
```
##### Show #####
```
az workloads sap-central-instance show --central-instance-name "centralServer" --resource-group "test-rg" \
    --sap-virtual-instance-name "X00" 
```
##### List #####
```
az workloads sap-central-instance list --resource-group "test-rg" --sap-virtual-instance-name "X00"
```
##### Update #####
```
az workloads sap-central-instance update --tags tag1="value1" --central-instance-name "centralServer" \
    --resource-group "test-rg" --sap-virtual-instance-name "X00" 
```
##### Delete #####
```
az workloads sap-central-instance delete --central-instance-name "centralServer" --resource-group "test-rg" \
    --sap-virtual-instance-name "X00" 
```
#### workloads sap-database-instance ####
##### Create #####
```
az workloads sap-database-instance create --location "westcentralus" --database-instance-name "databaseServer" \
    --resource-group "test-rg" --sap-virtual-instance-name "X00" 
```
##### Show #####
```
az workloads sap-database-instance show --database-instance-name "databaseServer" --resource-group "test-rg" \
    --sap-virtual-instance-name "X00" 
```
##### List #####
```
az workloads sap-database-instance list --resource-group "test-rg" --sap-virtual-instance-name "X00"
```
##### Update #####
```
az workloads sap-database-instance update --tags key1="value1" --database-instance-name "databaseServer" \
    --resource-group "test-rg" --sap-virtual-instance-name "X00" 
```
##### Delete #####
```
az workloads sap-database-instance delete --database-instance-name "databaseServer" --resource-group "test-rg" \
    --sap-virtual-instance-name "X00" 
```
#### workloads sap-application-server-instance ####
##### Create #####
```
az workloads sap-application-server-instance create --application-instance-name "app01" --location "westcentralus" \
    --resource-group "test-rg" --sap-virtual-instance-name "X00" 
```
##### Show #####
```
az workloads sap-application-server-instance show --application-instance-name "app01" --resource-group "test-rg" \
    --sap-virtual-instance-name "X00" 
```
##### List #####
```
az workloads sap-application-server-instance list --resource-group "test-rg" --sap-virtual-instance-name "X00"
```
##### Update #####
```
az workloads sap-application-server-instance update --application-instance-name "app01" --tags tag1="value1" \
    --resource-group "test-rg" --sap-virtual-instance-name "X00" 
```
##### Delete #####
```
az workloads sap-application-server-instance delete --application-instance-name "app01" --resource-group "test-rg" \
    --sap-virtual-instance-name "X00" 
```