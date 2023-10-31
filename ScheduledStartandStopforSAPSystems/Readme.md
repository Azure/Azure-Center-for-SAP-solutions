## Automate scheduled start and stop of SAP systems, HANA database and underlying virtual machines

The example [ARM template](https://github.com/Azure/Azure-Center-for-SAP-solutions/blob/main/ScheduledStartandStopforSAPSystems/azuredeploy.json) enables you to deploy a Logic App that triggers start and stop of SAP systems, HANA database and underlying Virtual machines at a schedule like Daily, Weekly or Monthly. You can make changes to the ARM template or deployed Logic App to suit any specific requirements. 

[![Deploy To Azure](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.svg?sanitize=true)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2FAzure-Center-for-SAP-solutions%2Fmain%2FScheduledStartandStopforSAPSystems%2Fazuredeploy.json/createUIDefinitionUri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2FAzure-Center-for-SAP-solutions%2Fmain%2FScheduledStartandStopforSAPSystems%2FcreateUiDefinition.json)

## Setup start and stop schedule for SAP systems
In this guide, you’ll learn how to automate start and stop of SAP systems and their underlying Virtual machines using Azure Center for SAP solutions and other Azure services like Logic apps. 

This automated start and stop of SAP enables you to easily optimize cost of running SAP workloads on pay-as-you-go Virtual machines by keeping your systems turned on only when you need them. This capability also allows you to stop and start SAP systems and HANA Databases at-scale during your patching or maintenance window. 

With Azure Center for SAP solutions, you can stop and start SAP, individual instances and HANA database using Azure Portal, PowerShell, CLI and REST APIs. You can stop and start the underlying Virtual machines using the Start and Stop REST APIs. This currently is available only via REST APIs. 

### Prerequisites
- An SAP system that you've created in Azure Center for SAP solutions or registered with Azure Center for SAP solutions as a Virtual Instance for SAP solutions resource.
- An Azure account with Contributor or equivalent role access to be able to deploy and configure resources like Logic Apps, Action groups, Alert rules. 
- A user assigned managed identity with Azure Center for SAP solutions administrator or equivalent role access on the Virtual Instance for SAP solutions resources. You can learn more about the granular permissions that govern Start and Stop actions on the VIS, individual SAP instances and HANA Database [in this article](https://learn.microsoft.com/en-us/azure/sap/center-sap-solutions/manage-with-azure-rbac#start-sap-system).
- User assigned managed identity already associated with the VIS resource must have **Virtual Machine Contributor** role assigned, so that ACSS service can start and stop Virtual machines. 
- The sapstartsrv service must be auto-start enabled in the SAP instance profile parameters.

### Steps to deploy the ARM template
1.	Click on [this link](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2FAzure-Center-for-SAP-solutions%2Fmain%2FScheduledStartandStopforSAPSystems%2Fazuredeploy.json/createUIDefinitionUri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2FAzure-Center-for-SAP-solutions%2Fmain%2FScheduledStartandStopforSAPSystems%2FcreateUiDefinition.json) to sign in to Azure Portal and open an ARM template deployment screen.
2.	Select or enter the following values.
   - **Subscription**: select an Azure subscription into which the resources are to be deployed
   - **Resource Group**: select an existing resource group from the drop-down, or select Create new, enter a unique name for the resource group, and select OK.
   - **Region**: select a region in which the resources are to be deployed
   - **Logic app name**: provide a name such as DailySAPSandBoxStopSchedule, WeeklySAPQAStartSchedule.
   - **User assigned managed identity**: provide the identity which executes the Start and Stop of virtual instance for SAP solutions resources. This identity should have Azure Center for SAP solutions administrator or equivalent role access. The resource ID must be in the format /subscriptions/Sub1/resourceGroups/RG1/providers/Microsoft.ManagedIdentity/userAssignedIdentities/Contoso-MSI.
  - **Virtual Instance for SAP solutions resource IDs**: provide a list of VIS resource IDs which should be stopped or started as per the schedule defined. List should be provided in the format [“/subscriptions/abcde-3d36-4585-bdb9-d3364786e775/resourceGroups/Contoso-1/providers/Microsoft.Workloads/sapVirtualInstances/CS1”, “/subscriptions/abcdef-3d36-4585-bdb9-d3364786e775/resourceGroups/Contoso-2/providers/Microsoft.Workloads/sapVirtualInstances/CS2”]
   - **SAP Operation type**: select the operation Start or Stop for which you want to setup the schedule.
   - **Include database operations**: select yes if you want to schedule stop or start the HANA database instance of the SAP system. Note that this is applicable only for SAP systems running on HANA database. 
   - **Include virtual machine operations**: select yes if you want to schedule stop or start the underlying Virtual machines of the SAP system and HANA database. If you select No, only the application is stopped/started and virtual machines are not impacted.
  - **Operation execution**: select sequenced if you want each Virtual Instance for SAP solutions resource to stop or start in a sequence and concurrent if they can be stopped or started in parallel.
  - **Soft stop timeout**: provide a timeout value in seconds if you want the SAP systems to be soft stopped. When value is 0, a hard stop operation is initiated.
  - **Frequency**: select the frequency at which SAP systems need to be stopped and started. You choose Monthly, Weekly or Daily.
  - **Interval**: A positive integer that describes how often the workflow runs based on the frequency. [Learn more here](https://learn.microsoft.com/en-us/azure/connectors/connectors-native-recurrence?tabs=consumption#add-the-recurrence-trigger) about configuring the recurrence attributes *On these days*, *At these hours*, *At this minute*, *Timezone*, *Start time*.
  
3.	Select **Review + create**. After validation completes, select Create to deploy the template.
4.	The following resources are created in the resource group once the deployment is successful:
     - **Logic app**: This contains the schedule and workflow for stopping or starting the SAP systems and underlying VMs.
     - **Action group**: This resource is for you to configure different types of notifications for successful and failed start and stop operations on SAP systems.
     - **Activity log alert rule**: This alert rule is used for sending an alert notification when VIS start and stop operations fails. Action group deployed is associated with this alert rule.
     - **Metric alert rule**: this alert rule triggers a notification if the logic app fails to initiate the workflow. Action group deployed is associated with this alert rule.
     - **API connection**: Logic App invokes ACSS REST APIs and hence this API connection resource is deployed.

The Azure portal is used to deploy the template. In addition to the Azure portal, you can also use the Azure CLI, Azure PowerShell, and REST API. To learn other deployment methods, see [Deploy templates](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/deploy-cli).

### Review deployed resources
- You can review the deployed resources in the Resource group selected during ARM template deployment.
- You can also modify the recurrence schedule, Operation type, VIS resources associated and other parameters chosen during the deployment from the Logic App Designer page.
- User assigned managed identity selected during template deployment is associated with the Logic app. You can modify it from the Identity page under Settings in the left navigation of Logic App overview page.

### Clean up deployed resources
You can delete the resources deployed into the resource group if you wish to delete the schedule for starting and stopping SAP systems.
