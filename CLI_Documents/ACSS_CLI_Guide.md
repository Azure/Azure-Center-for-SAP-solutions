# Azure Center for SAP solutions (ACSS) CLI guide


## Table of Contents

- [Introduction](#introduction)
- [Install Extension](#install-extension)
- [Notes while using extension](#notes-while-using-extension)
- [Sample commands](#sample-commands)
- [Deploying or Registering an SAP system](#deploying-or-registering-an-sap-system)
- [Starting or Stopping an SAP system](#starting-or-stopping-an-sap-system)
- [List of Commands](#list-of-commands)
## Introduction

The different features of Azure Center for SAP solutions (ACSS) are available from the command line interface (CLI). This document will guide you on how to install Azure CLI and the ACSS extension and then also walk you through the different commands available for ACSS in Azure CLI.  

## Install Extension
1.	Install Azure CLI: [How to install the Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
2.	Install Python
3.	Make sure workloads extension is not installed using “az extension list”
- [This doc](https://docs.microsoft.com/en-us/cli/azure/extension?view=azure-cli-latest#az-extension-remove) can be used to remove any existing extension
4.  Download and Install the Workloads CLI extension from [here](https://github.com/Azure/Azure-Center-for-SAP-solutions-preview/tree/main/CLI_Documents/ACSS_CLI_Extension)
-   Use the following command to install

```
az extension add --source=./workloads-0.1.0-py3-none-any.whl
```

5.	Login to correct AZ account by using the below commands and choose the right subscription

```
az login
az account set --subscription "<ACCOUNT_SUBSCRIPTION_ID>"
```

6.	Perform SAP Virtual Instance operations through the Workloads extension that you just installed. 
- To do a quick test if the installation went through correctly, run the basic commands:
```
az workloads -- help
```

## Notes while using extension
- Use same location for Service location and Application Location.

## Sample commands 
The following section will show you sample commands and their results. You can use these and customise the input values to your need. 

### Command Group: az workloads 

#### Command: az workloads sap-availability-zone-detail

**Examples**
```
az workloads sap-availability-zone-detail --app-location "eastus" --database-type "HANA" --sap-product "S4HANA" --location "centralus" 
az workloads sap-availability-zone-detail --app-location "northeurope" --database-type "HANA" --sap-product "S4HANA" --location "northeurope" 
```

#### Command: az workloads sap-disk-configuration 
**Examples**
```
az workloads sap-disk-configuration --app-location "northeurope" --database-type "HANA" --db-vm-sku "Standard_M32ts" --deployment-type "SingleServer" --environment "NonProd" --sap-product "S4HANA" --location "northeurope" 
```
#### Command: az workloads sap-sizing-recommendation 
**Examples**

```
az workloads sap-sizing-recommendation --app-location "northeurope" --database-type "HANA" --db-memory 2000 --deployment-type "SingleServer" --environment "NonProd" --sap-product "S4HANA" --saps 60000 --location "northeurope" 
```

#### Command: az workloads sap-supported-sku 
**Examples**

````
az workloads sap-supported-sku --app-location "eastus2" --database-type "HANA" --deployment-type "SingleServer" --environment "NonProd" --sap-product "S4HANA" --location "eastus2" 
````

### Command Group: az workloads sap-virtual-instance 

#### Command: az workloads sap-virtual-instance list by RG 
**Examples**

```
az workloads sap-virtual-instance list --resource-group "test-rg" 
```

#### Command: az workloads sap-virtual-instance list 
**Examples**

```
az workloads sap-virtual-instance list 
```

#### Command: az workloads sap-virtual-instance show 
**Examples**

```
az workloads sap-virtual-instance show --resource-group "test-rg" --name "<Name of Virtual instance for SAP solutions)>" 
```

## Deploying or Registering an SAP system

The command group for deploying or registering an SAP system is the same as above: **az workloads sap-virtual-instance**

#### Command: az workloads sap-virtual-instance create 

The create command in the CLI extension of ACSS is used to perform three different type of operations: 
- Create infrastructure for an SAP system
- Install software on the deployed infrastructure for an SAP system 
- Registering an SAP system in Azure with ACSS

**Example**

- Create infrastructure for an SAP system
     - Below example shows how to create infrastructure for a new SAP system (SID) from ACSS. This is step one of deploying an SAP system on Azure through ACSS
     - This example is for deploying a single server SAP system. You can change the parameters and payload in the command to make your desired deployment type
     - You can see the sample payload here [Infrastructure Creation Payload.json](https://github.com/Azure/Azure-Center-for-SAP-solutions-preview/blob/main/CLI_Documents/Infrastructure%20Creation%20Payload.json)

```
az workloads sap-virtual-instance create --location "eastus2" --configuration "@Infrastructure Creation Payload.json" --environment "Prod" --sap-product "S4HANA" --resource-group "test-rg" --sap-virtual-instance-name "AG5" 
```


-	Install software on the deployed infrastructure for an SAP system

     - The example below shows the command and corresponding payload for the installation of SAP software on the infrastructure deployed in the previous example. 
     - Please note that the command remains the same, but the payload is different. In the payload, in addition to the inputs in create infra, you will also need to provide the path for the SAP bits to be installed and the private ssh key for the VMs in order for ACSS to install the SAP software on the infrastructure deployed. 
     - For prerequisites for installation, please see [here](https://docs.microsoft.com/en-us/azure/center-sap-solutions/install-software)
     - You can see the sample payload here [Software Install Payload.json](https://github.com/Azure/Azure-Center-for-SAP-solutions-preview/blob/main/CLI_Documents/Software%20Install%20Payload.json)

```
az workloads sap-virtual-instance create --location "eastus2" --configuration "@Input_CreateInfra_DistributedNonHA_config.json" --environment "Prod" --sap-product "S4HANA" --resource-group "test-rg" --sap-virtual-instance-name "AG5" 
```

-	Registering an SAP system in Azure with ACSS

     - The example below shows the command for registering an existing SAP system in Azure with ACSS 
     - Please note that the command remains the same, but the payload is different. In this payload, you need to provide the VM ID for the central server. In a separate payload you should have the User Assigned Managed identity that you intend to use for registering this system.  
     - For prerequisites of registering, please see [here](https://docs.microsoft.com/en-us/azure/center-sap-solutions/register-existing-system)
     - You can see the sample payloads here [Register Payload.json](https://github.com/Azure/Azure-Center-for-SAP-solutions-preview/blob/main/CLI_Documents/Register%20Payload.json), [MSI.json]

```
az workloads sap-virtual-instance create --location "eastus2" --configuration "Registerpayload.json" --environment "Prod" --sap-product "S4HANA" --sap-virtual-instance-name "CS3" --name "KN1-MRG" --resource-group "CONTOSO-4" --user-assigned-identities "MSI.json" --type "UserAssigned" 
```

#### Command: az workloads sap-virtual-instance update 
**Example**
```
az workloads sap-virtual-instance update --resource-group "test-rg" --name "AG5" --tags Tag1='TagValue'
```

#### Command: az workloads sap-virtual-instance delete 
**Example**
```
az workloads sap-virtual-instance delete --resource-group "test-rg" --name "AG5" 
```

## Starting or Stopping an SAP system

#### Command: az workloads sap-virtual-instance start/stop

- Please refer to the documentation for Start/Stop feature in ACSS [here](https://docs.microsoft.com/en-us/azure/center-sap-solutions/start-stop-sap-systems). 

**Example**
```
az workloads sap-virtual-instance start --sap-password "<password>" --sap-username "<username>" --resource-group "test-rg" --name "AG5" 
```


## List of Commands

Please see below the list of commands available from the ACSs CLI extension. You can use the above samples and edit them for your use or you can refer to [README.md](https://github.com/Azure/Azure-Center-for-SAP-solutions-preview/blob/main/CLI_Documents/ACSS_CLI_Extension/README.md) for additional help on the extension. 


| CLI Command	| Operation Swagger name	| Comments |
|-------------|-------------------------|----------|
| az workloads sap-availability-zone-detail 	| SAPAvailabilityZoneDetails 	|    |
| az workloads sap-disk-configuration 	| SAPDiskConfigurations 	|    |
| az workloads sap-sizing-recommendation 	| SAPSizingRecommendations 	|    |
| az workloads sap-supported-sku 	| SAPSupportedSku 	|    |
| VIS 	| 	|  |
| az workloads sap-virtual-instance list 	| ListByResourceGroup 	|    |
| az workloads sap-virtual-instance list 	| ListBySubscription 	|    |
| az workloads sap-virtual-instance show 	| Get 	|    |
| az workloads sap-virtual-instance create 	| Create 	|    |
| az workloads sap-virtual-instance update 	| Update 	| Replaces Tags, instead of adding them. This goes with CLI design and is correct way so that we can remove tags as well  |
| az workloads sap-virtual-instance delete 	| Delete 	|    |
| az workloads sap-virtual-instance start 	| Start 	|  |
| az workloads sap-virtual-instance stop 	| Stop 	|  |
| App Server Instance 	| 	|  |
| az workloads sap-application-server-instance list 	| List 	|    |
| az workloads sap-application-server-instance show 	| Get 	|    |
| az workloads sap-application-server-instance create 	| Create 	| payload Option missing. Body is readOnly, not allowed to be created separately, so this is valid  |
| az workloads sap-application-server-instance update 	| Update 	| Replaces Tags, instead of adding them. This goes with CLI design and is correct way so that we can remove tags as well  |
| az workloads sap-application-server-instance delete 	| Delete 	|    |
| Central Server Instance 	| 	|  |
| az workloads sap-central-instance list 	| List 	|    |
| az workloads sap-central-instance show 	| Get 	|    |
| az workloads sap-central-instance create 	| Create 	| payload Option missing. Body is readOnly, not allowed to be created separately, so this is valid  |
| az workloads sap-central-instance update 	| Update 	| Replaces Tags, instead of adding them. This goes with CLI design and is correct way so that we can remove tags as well  |
| az workloads sap-central-instance delete 	| Delete 	|    |
| Database Instance 	| 	|  |
| az workloads sap-database-instance list 	| List 	|    |
| az workloads sap-database-instance show 	| Get 	|    |
| az workloads sap-database-instance create 	| Create 	| payload Option missing. Body is readOnly, not allowed to be created separately, so this is valid  |
| az workloads sap-database-instance update 	| Update 	| Replaces Tags, instead of adding them. This goes with CLI design and is correct way so that we can remove tags as well  |
| az workloads sap-database-instance delete 	| Delete 	|    |


