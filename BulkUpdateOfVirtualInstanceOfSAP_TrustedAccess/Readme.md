# Update managed storage account network settings for a Virtual Instance for SAP solutions resource 
This script is designed to facilitate the bulk update the network access settings of the managed storage account associated to Virtual Instance for SAP solutions (VIS) resources in Azure. You can update the managed storage account network access to be limited to specific virtual networks or make it publicly accessible. [Learn more here](https://learn.microsoft.com/en-us/azure/sap/center-sap-solutions/register-existing-system#managed-storage-account-network-access-settings) about Managed Storage account network settings.

The script leverages **Az.Workloads** PowerShell module to interact with Azure services and performs the following tasks:

1. Retrieves a list of VIS resources based on subscription and/or specified Azure Resource IDs.
2. Filters VIS based on their state. Only VIS with Provisioning State of "RegistrationComplete" or "SoftwareInstallationPending" can be updated.

## Input file
The script requires a JSON input file (Input.json) with the following structure:

``` json
{
  "SubscriptionId": "your_subscription_id",
  "ResourceIds": [
    "/subscriptions/your_subscription_id/resourceGroups/your_resource_group/providers/Microsoft.Workloads/sapVirtualInstances/svi1",
    "/subscriptions/your_subscription_id/resourceGroups/your_resource_group/providers/Microsoft.Workloads/sapVirtualInstances/svi2"
  ],
  "AccessType": "Private/Public",
  "identity": "userAssignedIdentityId"
}
```

- SubscriptionId: Azure subscription ID. When you provide the Subscription ID, all VIS resources in that will be updated by the script.
- ResourceIds: Array of specific VIS resource IDs to update.
- AccessType: (Optional) Network access type setting for the storage account which is in the [managed resource group](https://learn.microsoft.com/en-us/azure/sap/center-sap-solutions/register-existing-system#managed-storage-account-network-access-settings) associated to the VIS. Choose **Private** if you wish to restrict access to this storage account to the virtual network in which the SAP system exists. Choosing **Public** will make the storage account accessible from all networks. 
- identity: (Optional) User-assigned managed identity name.


## VIS update scenarios

1. Update the Managed storage account Network Access Type associated with the VIS resource
**NOTE:** Provide either the Subscription Id or the list of Resource Ids

``` json
{
  "SubscriptionId": "your_subscription_id",
  "ResourceIds": [
    "/subscriptions/your_subscription_id/resourceGroups/your_resource_group/providers/Microsoft.Workloads/sapVirtualInstances/svi1",
    "/subscriptions/your_subscription_id/resourceGroups/your_resource_group/providers/Microsoft.Workloads/sapVirtualInstances/svi2"
  ],
  "AccessType": "Private/Public"
}
```

2. Update the Managed storage account Network Access Type and User assigned managed identity associated with the VIS resources
``` json
{
  "SubscriptionId": "your_subscription_id",
  "ResourceIds": [
    "/subscriptions/your_subscription_id/resourceGroups/your_resource_group/providers/Microsoft.Workloads/sapVirtualInstances/svi1",
    "/subscriptions/your_subscription_id/resourceGroups/your_resource_group/providers/Microsoft.Workloads/sapVirtualInstances/svi2"
  ],
  "AccessType": "Private/Public",
  "Identity": "userAssignedIdentityId"
}
```

**NOTE:** VIS resources are processed in parallel using PowerShell jobs for improved efficiency.

## Execute the script 
Use the following the command to run the script:

``` powershell
.\BulkMigrationScript.ps1 -JsonFilePath .\Input.json
```

### Script output
Review the generated **sviStatus.txt** file for details on VIS that are successfully processed and those that failed to be processed.
