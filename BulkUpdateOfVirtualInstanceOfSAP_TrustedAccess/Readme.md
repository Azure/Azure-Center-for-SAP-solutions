# Bulk Migration Script
The Bulk Migration Script is designed to facilitate the bulk migration of SAP Virtual Instances (SVIs) in Azure from public managed resource group storage account to private and vice versa. It leverages the Az.Workloads PowerShell module to interact with Azure services and performs the following tasks:

1. Retrieves a list of SVIs based on subscription and/or specified ResourceIds.
2. Filters SVIs based on their state. Only SVIs with "RegistrationComplete" or "SoftwareInstallationPending" can be patched.

## Input
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

- SubscriptionId: Azure subscription ID. **[NOTE: Providing the Subscription ID will process all the SVIs belonging to the given subscription]**
- ResourceIds: Array of specific SVI resource IDs to process.
- AccessType: (Optional) Network access type for patching SVIs (default: "Private").
- identity: (Optional) User-assigned managed identity name. (default: null)


## Scenarios Covered

1. Update the Managed Resources Network Access Type **[NOTE: Either Give Subscription Id or List of Resource Id]**

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

2. Update the Managed Resources Network Access Type and Identity
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

**Parallel Execution: SVIs are processed in parallel using PowerShell jobs for improved efficiency.**


## Run the script with the following command:

``` powershell
.\BulkMigrationScript.ps1 -JsonFilePath .\Input.json
```

### Script output
Review the generated **sviStatus.txt** file for details on SVIs to be processed and those that cannot be processed.