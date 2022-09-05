# Azure CLI Module Creation Report

## EXTENSION
|CLI Extension|Command Groups|
|---------|------------|
|az workloads|[groups](#CommandGroups)

## GROUPS
### <a name="CommandGroups">Command groups in `az workloads` extension </a>
|CLI Command Group|Group Swagger name|Commands|
|---------|------------|--------|
|az workloads||[commands](#CommandsIn)|
|az workloads sap-application-server-instance|SAPApplicationServerInstances|[commands](#CommandsInSAPApplicationServerInstances)|
|az workloads sap-central-instance|SAPCentralInstances|[commands](#CommandsInSAPCentralInstances)|
|az workloads sap-database-instance|SAPDatabaseInstances|[commands](#CommandsInSAPDatabaseInstances)|
|az workloads sap-virtual-instance|SAPVirtualInstances|[commands](#CommandsInSAPVirtualInstances)|

## COMMANDS
### <a name="CommandsIn">Commands in `az workloads` group</a>
|CLI Command|Operation Swagger name|Parameters|Examples|
|---------|------------|--------|-----------|
|[az workloads sap-availability-zone-detail](#SAPAvailabilityZoneDetails)|SAPAvailabilityZoneDetails|[Parameters](#ParametersSAPAvailabilityZoneDetails)|[Example](#ExamplesSAPAvailabilityZoneDetails)|
|[az workloads sap-disk-configuration](#SAPDiskConfigurations)|SAPDiskConfigurations|[Parameters](#ParametersSAPDiskConfigurations)|[Example](#ExamplesSAPDiskConfigurations)|
|[az workloads sap-sizing-recommendation](#SAPSizingRecommendations)|SAPSizingRecommendations|[Parameters](#ParametersSAPSizingRecommendations)|[Example](#ExamplesSAPSizingRecommendations)|
|[az workloads sap-supported-sku](#SAPSupportedSku)|SAPSupportedSku|[Parameters](#ParametersSAPSupportedSku)|[Example](#ExamplesSAPSupportedSku)|

### <a name="CommandsInSAPApplicationServerInstances">Commands in `az workloads sap-application-server-instance` group</a>
|CLI Command|Operation Swagger name|Parameters|Examples|
|---------|------------|--------|-----------|
|[az workloads sap-application-server-instance list](#SAPApplicationServerInstancesList)|List|[Parameters](#ParametersSAPApplicationServerInstancesList)|[Example](#ExamplesSAPApplicationServerInstancesList)|
|[az workloads sap-application-server-instance show](#SAPApplicationServerInstancesGet)|Get|[Parameters](#ParametersSAPApplicationServerInstancesGet)|[Example](#ExamplesSAPApplicationServerInstancesGet)|
|[az workloads sap-application-server-instance create](#SAPApplicationServerInstancesCreate)|Create|[Parameters](#ParametersSAPApplicationServerInstancesCreate)|[Example](#ExamplesSAPApplicationServerInstancesCreate)|
|[az workloads sap-application-server-instance update](#SAPApplicationServerInstancesUpdate)|Update|[Parameters](#ParametersSAPApplicationServerInstancesUpdate)|[Example](#ExamplesSAPApplicationServerInstancesUpdate)|
|[az workloads sap-application-server-instance delete](#SAPApplicationServerInstancesDelete)|Delete|[Parameters](#ParametersSAPApplicationServerInstancesDelete)|[Example](#ExamplesSAPApplicationServerInstancesDelete)|

### <a name="CommandsInSAPCentralInstances">Commands in `az workloads sap-central-instance` group</a>
|CLI Command|Operation Swagger name|Parameters|Examples|
|---------|------------|--------|-----------|
|[az workloads sap-central-instance list](#SAPCentralInstancesList)|List|[Parameters](#ParametersSAPCentralInstancesList)|[Example](#ExamplesSAPCentralInstancesList)|
|[az workloads sap-central-instance show](#SAPCentralInstancesGet)|Get|[Parameters](#ParametersSAPCentralInstancesGet)|[Example](#ExamplesSAPCentralInstancesGet)|
|[az workloads sap-central-instance create](#SAPCentralInstancesCreate)|Create|[Parameters](#ParametersSAPCentralInstancesCreate)|[Example](#ExamplesSAPCentralInstancesCreate)|
|[az workloads sap-central-instance update](#SAPCentralInstancesUpdate)|Update|[Parameters](#ParametersSAPCentralInstancesUpdate)|[Example](#ExamplesSAPCentralInstancesUpdate)|
|[az workloads sap-central-instance delete](#SAPCentralInstancesDelete)|Delete|[Parameters](#ParametersSAPCentralInstancesDelete)|[Example](#ExamplesSAPCentralInstancesDelete)|

### <a name="CommandsInSAPDatabaseInstances">Commands in `az workloads sap-database-instance` group</a>
|CLI Command|Operation Swagger name|Parameters|Examples|
|---------|------------|--------|-----------|
|[az workloads sap-database-instance list](#SAPDatabaseInstancesList)|List|[Parameters](#ParametersSAPDatabaseInstancesList)|[Example](#ExamplesSAPDatabaseInstancesList)|
|[az workloads sap-database-instance show](#SAPDatabaseInstancesGet)|Get|[Parameters](#ParametersSAPDatabaseInstancesGet)|[Example](#ExamplesSAPDatabaseInstancesGet)|
|[az workloads sap-database-instance create](#SAPDatabaseInstancesCreate)|Create|[Parameters](#ParametersSAPDatabaseInstancesCreate)|[Example](#ExamplesSAPDatabaseInstancesCreate)|
|[az workloads sap-database-instance update](#SAPDatabaseInstancesUpdate)|Update|[Parameters](#ParametersSAPDatabaseInstancesUpdate)|[Example](#ExamplesSAPDatabaseInstancesUpdate)|
|[az workloads sap-database-instance delete](#SAPDatabaseInstancesDelete)|Delete|[Parameters](#ParametersSAPDatabaseInstancesDelete)|[Example](#ExamplesSAPDatabaseInstancesDelete)|

### <a name="CommandsInSAPVirtualInstances">Commands in `az workloads sap-virtual-instance` group</a>
|CLI Command|Operation Swagger name|Parameters|Examples|
|---------|------------|--------|-----------|
|[az workloads sap-virtual-instance list](#SAPVirtualInstancesListByResourceGroup)|ListByResourceGroup|[Parameters](#ParametersSAPVirtualInstancesListByResourceGroup)|[Example](#ExamplesSAPVirtualInstancesListByResourceGroup)|
|[az workloads sap-virtual-instance list](#SAPVirtualInstancesListBySubscription)|ListBySubscription|[Parameters](#ParametersSAPVirtualInstancesListBySubscription)|[Example](#ExamplesSAPVirtualInstancesListBySubscription)|
|[az workloads sap-virtual-instance show](#SAPVirtualInstancesGet)|Get|[Parameters](#ParametersSAPVirtualInstancesGet)|[Example](#ExamplesSAPVirtualInstancesGet)|
|[az workloads sap-virtual-instance create](#SAPVirtualInstancesCreate)|Create|[Parameters](#ParametersSAPVirtualInstancesCreate)|[Example](#ExamplesSAPVirtualInstancesCreate)|
|[az workloads sap-virtual-instance update](#SAPVirtualInstancesUpdate)|Update|[Parameters](#ParametersSAPVirtualInstancesUpdate)|[Example](#ExamplesSAPVirtualInstancesUpdate)|
|[az workloads sap-virtual-instance delete](#SAPVirtualInstancesDelete)|Delete|[Parameters](#ParametersSAPVirtualInstancesDelete)|[Example](#ExamplesSAPVirtualInstancesDelete)|
|[az workloads sap-virtual-instance start](#SAPVirtualInstancesStart)|Start|[Parameters](#ParametersSAPVirtualInstancesStart)|[Example](#ExamplesSAPVirtualInstancesStart)|
|[az workloads sap-virtual-instance stop](#SAPVirtualInstancesStop)|Stop|[Parameters](#ParametersSAPVirtualInstancesStop)|[Example](#ExamplesSAPVirtualInstancesStop)|


## COMMAND DETAILS
### group `az workloads`
#### <a name="SAPAvailabilityZoneDetails">Command `az workloads sap-availability-zone-detail`</a>

##### <a name="ExamplesSAPAvailabilityZoneDetails">Example</a>
```
az workloads sap-availability-zone-detail --app-location "eastus" --database-type "HANA" --sap-product "S4HANA" \
--location "centralus"
az workloads sap-availability-zone-detail --app-location "northeurope" --database-type "HANA" --sap-product "S4HANA" \
--location "centralus"
```
##### <a name="ParametersSAPAvailabilityZoneDetails">Parameters</a> 
|Option|Type|Description|Path (SDK)|Swagger name|
|------|----|-----------|----------|------------|
|**--location**|string|The name of Azure region.|location|location|
|**--app-location**|string|The geo-location where the SAP resources will be created.|app_location|appLocation|
|**--sap-product**|choice|Defines the SAP Product type.|sap_product|sapProduct|
|**--database-type**|choice|The database type. Eg: HANA, DB2, etc|database_type|databaseType|

#### <a name="SAPDiskConfigurations">Command `az workloads sap-disk-configuration`</a>

##### <a name="ExamplesSAPDiskConfigurations">Example</a>
```
az workloads sap-disk-configuration --app-location "eastus" --database-type "HANA" --db-vm-sku "Standard_M32ts" \
--deployment-type "SingleServer" --environment "NonProd" --sap-product "S4HANA" --location "centralus"
az workloads sap-disk-configuration --app-location "eastus" --database-type "HANA" --db-vm-sku "Standard_M32ts" \
--deployment-type "ThreeTier" --environment "Prod" --sap-product "S4HANA" --location "centralus"
```
##### <a name="ParametersSAPDiskConfigurations">Parameters</a> 
|Option|Type|Description|Path (SDK)|Swagger name|
|------|----|-----------|----------|------------|
|**--location**|string|The name of Azure region.|location|location|
|**--app-location**|string|The geo-location where the SAP resources will be created.|app_location|appLocation|
|**--environment**|choice|Defines the environment type - Production/Non Production.|environment|environment|
|**--sap-product**|choice|Defines the SAP Product type.|sap_product|sapProduct|
|**--database-type**|choice|The database type. Eg: HANA, DB2, etc|database_type|databaseType|
|**--deployment-type**|choice|The deployment type. Eg: SingleServer/ThreeTier|deployment_type|deploymentType|
|**--db-vm-sku**|string|The VM SKU for database instance.|db_vm_sku|dbVmSku|

#### <a name="SAPSizingRecommendations">Command `az workloads sap-sizing-recommendation`</a>

##### <a name="ExamplesSAPSizingRecommendations">Example</a>
```
az workloads sap-sizing-recommendation --app-location "eastus" --database-type "HANA" --db-memory 1024 \
--deployment-type "ThreeTier" --environment "Prod" --sap-product "S4HANA" --saps 20000 --location "centralus"
az workloads sap-sizing-recommendation --app-location "eastus" --database-type "HANA" --db-memory 1024 \
--deployment-type "ThreeTier" --environment "Prod" --high-availability-type "AvailabilitySet" --sap-product "S4HANA" \
--saps 75000 --location "centralus"
az workloads sap-sizing-recommendation --app-location "eastus" --database-type "HANA" --db-memory 1024 \
--deployment-type "ThreeTier" --environment "Prod" --high-availability-type "AvailabilityZone" --sap-product "S4HANA" \
--saps 75000 --location "centralus"
az workloads sap-sizing-recommendation --app-location "eastus" --database-type "HANA" --db-memory 2000 \
--deployment-type "SingleServer" --environment "NonProd" --sap-product "S4HANA" --saps 60000 --location "centralus"
```
##### <a name="ParametersSAPSizingRecommendations">Parameters</a> 
|Option|Type|Description|Path (SDK)|Swagger name|
|------|----|-----------|----------|------------|
|**--location**|string|The name of Azure region.|location|location|
|**--app-location**|string|The geo-location where the resource is to be created.|app_location|appLocation|
|**--environment**|choice|Defines the environment type - Production/Non Production.|environment|environment|
|**--sap-product**|choice|Defines the SAP Product type.|sap_product|sapProduct|
|**--deployment-type**|choice|The deployment type. Eg: SingleServer/ThreeTier|deployment_type|deploymentType|
|**--saps**|integer|The SAP Application Performance Standard measurement.|saps|saps|
|**--db-memory**|integer|The database memory configuration.|db_memory|dbMemory|
|**--database-type**|choice|The database type.|database_type|databaseType|
|**--high-availability-type**|choice|The high availability type.|high_availability_type|highAvailabilityType|

#### <a name="SAPSupportedSku">Command `az workloads sap-supported-sku`</a>

##### <a name="ExamplesSAPSupportedSku">Example</a>
```
az workloads sap-supported-sku --app-location "eastus" --database-type "HANA" --deployment-type "ThreeTier" \
--environment "Prod" --sap-product "S4HANA" --location "centralus"
az workloads sap-supported-sku --app-location "eastus" --database-type "HANA" --deployment-type "ThreeTier" \
--environment "Prod" --high-availability-type "AvailabilitySet" --sap-product "S4HANA" --location "centralus"
az workloads sap-supported-sku --app-location "eastus" --database-type "HANA" --deployment-type "ThreeTier" \
--environment "Prod" --high-availability-type "AvailabilityZone" --sap-product "S4HANA" --location "centralus"
az workloads sap-supported-sku --app-location "eastus" --database-type "HANA" --deployment-type "SingleServer" \
--environment "NonProd" --sap-product "S4HANA" --location "centralus"
```
##### <a name="ParametersSAPSupportedSku">Parameters</a> 
|Option|Type|Description|Path (SDK)|Swagger name|
|------|----|-----------|----------|------------|
|**--location**|string|The name of Azure region.|location|location|
|**--app-location**|string|The geo-location where the resource is to be created.|app_location|appLocation|
|**--environment**|choice|Defines the environment type - Production/Non Production.|environment|environment|
|**--sap-product**|choice|Defines the SAP Product type.|sap_product|sapProduct|
|**--deployment-type**|choice|The deployment type. Eg: SingleServer/ThreeTier|deployment_type|deploymentType|
|**--database-type**|choice|The database type. Eg: HANA, DB2, etc|database_type|databaseType|
|**--high-availability-type**|choice|The high availability type.|high_availability_type|highAvailabilityType|

### group `az workloads sap-application-server-instance`
#### <a name="SAPApplicationServerInstancesList">Command `az workloads sap-application-server-instance list`</a>

##### <a name="ExamplesSAPApplicationServerInstancesList">Example</a>
```
az workloads sap-application-server-instance list --resource-group "test-rg" --sap-virtual-instance-name "X00"
```
##### <a name="ParametersSAPApplicationServerInstancesList">Parameters</a> 
|Option|Type|Description|Path (SDK)|Swagger name|
|------|----|-----------|----------|------------|
|**--resource-group-name**|string|The name of the resource group. The name is case insensitive.|resource_group_name|resourceGroupName|
|**--sap-virtual-instance-name**|string|The name of the Virtual Instances for SAP.|sap_virtual_instance_name|sapVirtualInstanceName|

#### <a name="SAPApplicationServerInstancesGet">Command `az workloads sap-application-server-instance show`</a>

##### <a name="ExamplesSAPApplicationServerInstancesGet">Example</a>
```
az workloads sap-application-server-instance show --application-instance-name "app01" --resource-group "test-rg" \
--sap-virtual-instance-name "X00"
```
##### <a name="ParametersSAPApplicationServerInstancesGet">Parameters</a> 
|Option|Type|Description|Path (SDK)|Swagger name|
|------|----|-----------|----------|------------|
|**--resource-group-name**|string|The name of the resource group. The name is case insensitive.|resource_group_name|resourceGroupName|
|**--sap-virtual-instance-name**|string|The name of the Virtual Instances for SAP.|sap_virtual_instance_name|sapVirtualInstanceName|
|**--application-instance-name**|string|The name of SAP Application Server instance.|application_instance_name|applicationInstanceName|

#### <a name="SAPApplicationServerInstancesCreate">Command `az workloads sap-application-server-instance create`</a>

##### <a name="ExamplesSAPApplicationServerInstancesCreate">Example</a>
```
az workloads sap-application-server-instance create --application-instance-name "app01" --location "westcentralus" \
--resource-group "test-rg" --sap-virtual-instance-name "X00"
```
##### <a name="ParametersSAPApplicationServerInstancesCreate">Parameters</a> 
|Option|Type|Description|Path (SDK)|Swagger name|
|------|----|-----------|----------|------------|
|**--resource-group-name**|string|The name of the resource group. The name is case insensitive.|resource_group_name|resourceGroupName|
|**--sap-virtual-instance-name**|string|The name of the Virtual Instances for SAP.|sap_virtual_instance_name|sapVirtualInstanceName|
|**--application-instance-name**|string|The name of SAP Application Server instance.|application_instance_name|applicationInstanceName|
|**--location**|string|The geo-location where the resource lives|location|location|
|**--tags**|dictionary|Resource tags.|tags|tags|

#### <a name="SAPApplicationServerInstancesUpdate">Command `az workloads sap-application-server-instance update`</a>

##### <a name="ExamplesSAPApplicationServerInstancesUpdate">Example</a>
```
az workloads sap-application-server-instance update --application-instance-name "app01" --tags tag1="value1" \
--resource-group "test-rg" --sap-virtual-instance-name "X00"
```
##### <a name="ParametersSAPApplicationServerInstancesUpdate">Parameters</a> 
|Option|Type|Description|Path (SDK)|Swagger name|
|------|----|-----------|----------|------------|
|**--resource-group-name**|string|The name of the resource group. The name is case insensitive.|resource_group_name|resourceGroupName|
|**--sap-virtual-instance-name**|string|The name of the Virtual Instances for SAP.|sap_virtual_instance_name|sapVirtualInstanceName|
|**--application-instance-name**|string|The name of SAP Application Server instance.|application_instance_name|applicationInstanceName|
|**--tags**|dictionary|Gets or sets the Resource tags.|tags|tags|

#### <a name="SAPApplicationServerInstancesDelete">Command `az workloads sap-application-server-instance delete`</a>

##### <a name="ExamplesSAPApplicationServerInstancesDelete">Example</a>
```
az workloads sap-application-server-instance delete --application-instance-name "app01" --resource-group "test-rg" \
--sap-virtual-instance-name "X00"
```
##### <a name="ParametersSAPApplicationServerInstancesDelete">Parameters</a> 
|Option|Type|Description|Path (SDK)|Swagger name|
|------|----|-----------|----------|------------|
|**--resource-group-name**|string|The name of the resource group. The name is case insensitive.|resource_group_name|resourceGroupName|
|**--sap-virtual-instance-name**|string|The name of the Virtual Instances for SAP.|sap_virtual_instance_name|sapVirtualInstanceName|
|**--application-instance-name**|string|The name of SAP Application Server instance.|application_instance_name|applicationInstanceName|

### group `az workloads sap-central-instance`
#### <a name="SAPCentralInstancesList">Command `az workloads sap-central-instance list`</a>

##### <a name="ExamplesSAPCentralInstancesList">Example</a>
```
az workloads sap-central-instance list --resource-group "test-rg" --sap-virtual-instance-name "X00"
```
##### <a name="ParametersSAPCentralInstancesList">Parameters</a> 
|Option|Type|Description|Path (SDK)|Swagger name|
|------|----|-----------|----------|------------|
|**--resource-group-name**|string|The name of the resource group. The name is case insensitive.|resource_group_name|resourceGroupName|
|**--sap-virtual-instance-name**|string|The name of the Virtual Instances for SAP.|sap_virtual_instance_name|sapVirtualInstanceName|

#### <a name="SAPCentralInstancesGet">Command `az workloads sap-central-instance show`</a>

##### <a name="ExamplesSAPCentralInstancesGet">Example</a>
```
az workloads sap-central-instance show --central-instance-name "centralServer" --resource-group "test-rg" \
--sap-virtual-instance-name "X00"
```
##### <a name="ParametersSAPCentralInstancesGet">Parameters</a> 
|Option|Type|Description|Path (SDK)|Swagger name|
|------|----|-----------|----------|------------|
|**--resource-group-name**|string|The name of the resource group. The name is case insensitive.|resource_group_name|resourceGroupName|
|**--sap-virtual-instance-name**|string|The name of the Virtual Instances for SAP.|sap_virtual_instance_name|sapVirtualInstanceName|
|**--central-instance-name**|string|Central Instance name string modeled as parameter for auto generation to work correctly.|central_instance_name|centralInstanceName|

#### <a name="SAPCentralInstancesCreate">Command `az workloads sap-central-instance create`</a>

##### <a name="ExamplesSAPCentralInstancesCreate">Example</a>
```
az workloads sap-central-instance create --location "westcentralus" --central-instance-name "centralServer" \
--resource-group "test-rg" --sap-virtual-instance-name "X00"
```
##### <a name="ParametersSAPCentralInstancesCreate">Parameters</a> 
|Option|Type|Description|Path (SDK)|Swagger name|
|------|----|-----------|----------|------------|
|**--resource-group-name**|string|The name of the resource group. The name is case insensitive.|resource_group_name|resourceGroupName|
|**--sap-virtual-instance-name**|string|The name of the Virtual Instances for SAP.|sap_virtual_instance_name|sapVirtualInstanceName|
|**--central-instance-name**|string|Central Instance name string modeled as parameter for auto generation to work correctly.|central_instance_name|centralInstanceName|
|**--location**|string|The geo-location where the resource lives|location|location|
|**--tags**|dictionary|Resource tags.|tags|tags|

#### <a name="SAPCentralInstancesUpdate">Command `az workloads sap-central-instance update`</a>

##### <a name="ExamplesSAPCentralInstancesUpdate">Example</a>
```
az workloads sap-central-instance update --tags tag1="value1" --central-instance-name "centralServer" --resource-group \
"test-rg" --sap-virtual-instance-name "X00"
```
##### <a name="ParametersSAPCentralInstancesUpdate">Parameters</a> 
|Option|Type|Description|Path (SDK)|Swagger name|
|------|----|-----------|----------|------------|
|**--resource-group-name**|string|The name of the resource group. The name is case insensitive.|resource_group_name|resourceGroupName|
|**--sap-virtual-instance-name**|string|The name of the Virtual Instances for SAP.|sap_virtual_instance_name|sapVirtualInstanceName|
|**--central-instance-name**|string|Central Instance name string modeled as parameter for auto generation to work correctly.|central_instance_name|centralInstanceName|
|**--tags**|dictionary|Gets or sets the Resource tags.|tags|tags|

#### <a name="SAPCentralInstancesDelete">Command `az workloads sap-central-instance delete`</a>

##### <a name="ExamplesSAPCentralInstancesDelete">Example</a>
```
az workloads sap-central-instance delete --central-instance-name "centralServer" --resource-group "test-rg" \
--sap-virtual-instance-name "X00"
```
##### <a name="ParametersSAPCentralInstancesDelete">Parameters</a> 
|Option|Type|Description|Path (SDK)|Swagger name|
|------|----|-----------|----------|------------|
|**--resource-group-name**|string|The name of the resource group. The name is case insensitive.|resource_group_name|resourceGroupName|
|**--sap-virtual-instance-name**|string|The name of the Virtual Instances for SAP.|sap_virtual_instance_name|sapVirtualInstanceName|
|**--central-instance-name**|string|Central Instance name string modeled as parameter for auto generation to work correctly.|central_instance_name|centralInstanceName|

### group `az workloads sap-database-instance`
#### <a name="SAPDatabaseInstancesList">Command `az workloads sap-database-instance list`</a>

##### <a name="ExamplesSAPDatabaseInstancesList">Example</a>
```
az workloads sap-database-instance list --resource-group "test-rg" --sap-virtual-instance-name "X00"
```
##### <a name="ParametersSAPDatabaseInstancesList">Parameters</a> 
|Option|Type|Description|Path (SDK)|Swagger name|
|------|----|-----------|----------|------------|
|**--resource-group-name**|string|The name of the resource group. The name is case insensitive.|resource_group_name|resourceGroupName|
|**--sap-virtual-instance-name**|string|The name of the Virtual Instances for SAP.|sap_virtual_instance_name|sapVirtualInstanceName|

#### <a name="SAPDatabaseInstancesGet">Command `az workloads sap-database-instance show`</a>

##### <a name="ExamplesSAPDatabaseInstancesGet">Example</a>
```
az workloads sap-database-instance show --database-instance-name "databaseServer" --resource-group "test-rg" \
--sap-virtual-instance-name "X00"
```
##### <a name="ParametersSAPDatabaseInstancesGet">Parameters</a> 
|Option|Type|Description|Path (SDK)|Swagger name|
|------|----|-----------|----------|------------|
|**--resource-group-name**|string|The name of the resource group. The name is case insensitive.|resource_group_name|resourceGroupName|
|**--sap-virtual-instance-name**|string|The name of the Virtual Instances for SAP.|sap_virtual_instance_name|sapVirtualInstanceName|
|**--database-instance-name**|string|Database Instance string modeled as parameter for auto generation to work correctly.|database_instance_name|databaseInstanceName|

#### <a name="SAPDatabaseInstancesCreate">Command `az workloads sap-database-instance create`</a>

##### <a name="ExamplesSAPDatabaseInstancesCreate">Example</a>
```
az workloads sap-database-instance create --location "westcentralus" --database-instance-name "databaseServer" \
--resource-group "test-rg" --sap-virtual-instance-name "X00"
```
##### <a name="ParametersSAPDatabaseInstancesCreate">Parameters</a> 
|Option|Type|Description|Path (SDK)|Swagger name|
|------|----|-----------|----------|------------|
|**--resource-group-name**|string|The name of the resource group. The name is case insensitive.|resource_group_name|resourceGroupName|
|**--sap-virtual-instance-name**|string|The name of the Virtual Instances for SAP.|sap_virtual_instance_name|sapVirtualInstanceName|
|**--database-instance-name**|string|Database Instance string modeled as parameter for auto generation to work correctly.|database_instance_name|databaseInstanceName|
|**--location**|string|The geo-location where the resource lives|location|location|
|**--tags**|dictionary|Resource tags.|tags|tags|

#### <a name="SAPDatabaseInstancesUpdate">Command `az workloads sap-database-instance update`</a>

##### <a name="ExamplesSAPDatabaseInstancesUpdate">Example</a>
```
az workloads sap-database-instance update --tags key1="value1" --database-instance-name "databaseServer" \
--resource-group "test-rg" --sap-virtual-instance-name "X00"
```
##### <a name="ParametersSAPDatabaseInstancesUpdate">Parameters</a> 
|Option|Type|Description|Path (SDK)|Swagger name|
|------|----|-----------|----------|------------|
|**--resource-group-name**|string|The name of the resource group. The name is case insensitive.|resource_group_name|resourceGroupName|
|**--sap-virtual-instance-name**|string|The name of the Virtual Instances for SAP.|sap_virtual_instance_name|sapVirtualInstanceName|
|**--database-instance-name**|string|Database Instance string modeled as parameter for auto generation to work correctly.|database_instance_name|databaseInstanceName|
|**--tags**|dictionary|Gets or sets the Resource tags.|tags|tags|

#### <a name="SAPDatabaseInstancesDelete">Command `az workloads sap-database-instance delete`</a>

##### <a name="ExamplesSAPDatabaseInstancesDelete">Example</a>
```
az workloads sap-database-instance delete --database-instance-name "databaseServer" --resource-group "test-rg" \
--sap-virtual-instance-name "X00"
```
##### <a name="ParametersSAPDatabaseInstancesDelete">Parameters</a> 
|Option|Type|Description|Path (SDK)|Swagger name|
|------|----|-----------|----------|------------|
|**--resource-group-name**|string|The name of the resource group. The name is case insensitive.|resource_group_name|resourceGroupName|
|**--sap-virtual-instance-name**|string|The name of the Virtual Instances for SAP.|sap_virtual_instance_name|sapVirtualInstanceName|
|**--database-instance-name**|string|Database Instance string modeled as parameter for auto generation to work correctly.|database_instance_name|databaseInstanceName|

### group `az workloads sap-virtual-instance`
#### <a name="SAPVirtualInstancesListByResourceGroup">Command `az workloads sap-virtual-instance list`</a>

##### <a name="ExamplesSAPVirtualInstancesListByResourceGroup">Example</a>
```
az workloads sap-virtual-instance list --resource-group "test-rg"
```
##### <a name="ParametersSAPVirtualInstancesListByResourceGroup">Parameters</a> 
|Option|Type|Description|Path (SDK)|Swagger name|
|------|----|-----------|----------|------------|
|**--resource-group-name**|string|The name of the resource group. The name is case insensitive.|resource_group_name|resourceGroupName|

#### <a name="SAPVirtualInstancesListBySubscription">Command `az workloads sap-virtual-instance list`</a>

##### <a name="ExamplesSAPVirtualInstancesListBySubscription">Example</a>
```
az workloads sap-virtual-instance list
```
##### <a name="ParametersSAPVirtualInstancesListBySubscription">Parameters</a> 
|Option|Type|Description|Path (SDK)|Swagger name|
|------|----|-----------|----------|------------|

#### <a name="SAPVirtualInstancesGet">Command `az workloads sap-virtual-instance show`</a>

##### <a name="ExamplesSAPVirtualInstancesGet">Example</a>
```
az workloads sap-virtual-instance show --resource-group "test-rg" --name "X00"
```
##### <a name="ParametersSAPVirtualInstancesGet">Parameters</a> 
|Option|Type|Description|Path (SDK)|Swagger name|
|------|----|-----------|----------|------------|
|**--resource-group-name**|string|The name of the resource group. The name is case insensitive.|resource_group_name|resourceGroupName|
|**--sap-virtual-instance-name**|string|The name of the Virtual Instances for SAP.|sap_virtual_instance_name|sapVirtualInstanceName|

#### <a name="SAPVirtualInstancesCreate">Command `az workloads sap-virtual-instance create`</a>

##### <a name="ExamplesSAPVirtualInstancesCreate">Example</a>
```
az workloads sap-virtual-instance create --location "westcentralus" --configuration "{\\"appLocation\\":\\"eastus\\",\\\
"configurationType\\":\\"Deployment\\",\\"infrastructureConfiguration\\":{\\"appResourceGroup\\":\\"X00-RG\\",\\"applic\
ationServer\\":{\\"instanceCount\\":6,\\"subnetId\\":\\"/subscriptions/49d64d54-e966-4c46-a868-1999802b762c/resourceGro\
ups/dindurkhya-e2etesting/providers/Microsoft.Networks/virtualNetworks/test-vnet/subnets/appsubnet\\",\\"virtualMachine\
Configuration\\":{\\"imageReference\\":{\\"offer\\":\\"RHEL-SAP\\",\\"publisher\\":\\"RedHat\\",\\"sku\\":\\"7.4\\",\\"\
version\\":\\"7.4.2019062505\\"},\\"osProfile\\":{\\"adminUsername\\":\\"{your-username}\\",\\"osConfiguration\\":{\\"d\
isablePasswordAuthentication\\":true,\\"osType\\":\\"Linux\\",\\"ssh\\":{\\"publicKeys\\":[{\\"keyData\\":\\"ssh-rsa \
public key\\"}]}}},\\"vmSize\\":\\"Standard_E32ds_v4\\"}},\\"centralServer\\":{\\"instanceCount\\":1,\\"subnetId\\":\\"\
/subscriptions/49d64d54-e966-4c46-a868-1999802b762c/resourceGroups/dindurkhya-e2etesting/providers/Microsoft.Networks/v\
irtualNetworks/test-vnet/subnets/appsubnet\\",\\"virtualMachineConfiguration\\":{\\"imageReference\\":{\\"offer\\":\\"R\
HEL-SAP\\",\\"publisher\\":\\"RedHat\\",\\"sku\\":\\"7.4\\",\\"version\\":\\"7.4.2019062505\\"},\\"osProfile\\":{\\"adm\
inUsername\\":\\"{your-username}\\",\\"osConfiguration\\":{\\"disablePasswordAuthentication\\":true,\\"osType\\":\\"Lin\
ux\\",\\"ssh\\":{\\"publicKeys\\":[{\\"keyData\\":\\"ssh-rsa public key\\"}]}}},\\"vmSize\\":\\"Standard_E16ds_v4\\"}},\
\\"databaseServer\\":{\\"databaseType\\":\\"HANA\\",\\"instanceCount\\":1,\\"subnetId\\":\\"/subscriptions/49d64d54-e96\
6-4c46-a868-1999802b762c/resourceGroups/dindurkhya-e2etesting/providers/Microsoft.Networks/virtualNetworks/test-vnet/su\
bnets/dbsubnet\\",\\"virtualMachineConfiguration\\":{\\"imageReference\\":{\\"offer\\":\\"RHEL-SAP\\",\\"publisher\\":\
\\"RedHat\\",\\"sku\\":\\"7.4\\",\\"version\\":\\"7.4.2019062505\\"},\\"osProfile\\":{\\"adminUsername\\":\\"{your-user\
name}\\",\\"osConfiguration\\":{\\"disablePasswordAuthentication\\":true,\\"osType\\":\\"Linux\\",\\"ssh\\":{\\"publicK\
eys\\":[{\\"keyData\\":\\"ssh-rsa public key\\"}]}}},\\"vmSize\\":\\"Standard_M32ts\\"}},\\"deploymentType\\":\\"ThreeT\
ier\\"}}" --environment "Prod" --sap-product "S4HANA" --resource-group "test-rg" --sap-virtual-instance-name "X00"
az workloads sap-virtual-instance create --location "westcentralus" --configuration "{\\"appLocation\\":\\"eastus\\",\\\
"configurationType\\":\\"Deployment\\",\\"infrastructureConfiguration\\":{\\"appResourceGroup\\":\\"X00-RG\\",\\"applic\
ationServer\\":{\\"instanceCount\\":5,\\"subnetId\\":\\"/subscriptions/49d64d54-e966-4c46-a868-1999802b762c/resourceGro\
ups/dindurkhya-e2etesting/providers/Microsoft.Networks/virtualNetworks/test-vnet/subnets/appsubnet\\",\\"virtualMachine\
Configuration\\":{\\"imageReference\\":{\\"offer\\":\\"RHEL-SAP\\",\\"publisher\\":\\"RedHat\\",\\"sku\\":\\"7.4\\",\\"\
version\\":\\"7.4.2019062505\\"},\\"osProfile\\":{\\"adminUsername\\":\\"{your-username}\\",\\"osConfiguration\\":{\\"d\
isablePasswordAuthentication\\":true,\\"osType\\":\\"Linux\\",\\"ssh\\":{\\"publicKeys\\":[{\\"keyData\\":\\"ssh-rsa \
public key\\"}]}}},\\"vmSize\\":\\"Standard_E32ds_v4\\"}},\\"centralServer\\":{\\"instanceCount\\":2,\\"subnetId\\":\\"\
/subscriptions/49d64d54-e966-4c46-a868-1999802b762c/resourceGroups/dindurkhya-e2etesting/providers/Microsoft.Networks/v\
irtualNetworks/test-vnet/subnets/appsubnet\\",\\"virtualMachineConfiguration\\":{\\"imageReference\\":{\\"offer\\":\\"R\
HEL-SAP\\",\\"publisher\\":\\"RedHat\\",\\"sku\\":\\"7.4\\",\\"version\\":\\"7.4.2019062505\\"},\\"osProfile\\":{\\"adm\
inUsername\\":\\"{your-username}\\",\\"osConfiguration\\":{\\"disablePasswordAuthentication\\":true,\\"osType\\":\\"Lin\
ux\\",\\"ssh\\":{\\"publicKeys\\":[{\\"keyData\\":\\"ssh-rsa public key\\"}]}}},\\"vmSize\\":\\"Standard_E16ds_v4\\"}},\
\\"databaseServer\\":{\\"databaseType\\":\\"HANA\\",\\"instanceCount\\":2,\\"subnetId\\":\\"/subscriptions/49d64d54-e96\
6-4c46-a868-1999802b762c/resourceGroups/dindurkhya-e2etesting/providers/Microsoft.Networks/virtualNetworks/test-vnet/su\
bnets/dbsubnet\\",\\"virtualMachineConfiguration\\":{\\"imageReference\\":{\\"offer\\":\\"RHEL-SAP\\",\\"publisher\\":\
\\"RedHat\\",\\"sku\\":\\"7.4\\",\\"version\\":\\"7.4.2019062505\\"},\\"osProfile\\":{\\"adminUsername\\":\\"{your-user\
name}\\",\\"osConfiguration\\":{\\"disablePasswordAuthentication\\":true,\\"osType\\":\\"Linux\\",\\"ssh\\":{\\"publicK\
eys\\":[{\\"keyData\\":\\"ssh-rsa public key\\"}]}}},\\"vmSize\\":\\"Standard_M32ts\\"}},\\"deploymentType\\":\\"ThreeT\
ier\\",\\"highAvailabilityConfig\\":{\\"highAvailabilityType\\":\\"AvailabilitySet\\"}}}" --environment "Prod" \
--sap-product "S4HANA" --resource-group "test-rg" --sap-virtual-instance-name "X00"
az workloads sap-virtual-instance create --location "westcentralus" --configuration "{\\"appLocation\\":\\"eastus\\",\\\
"configurationType\\":\\"Deployment\\",\\"infrastructureConfiguration\\":{\\"appResourceGroup\\":\\"X00-RG\\",\\"applic\
ationServer\\":{\\"instanceCount\\":6,\\"subnetId\\":\\"/subscriptions/49d64d54-e966-4c46-a868-1999802b762c/resourceGro\
ups/dindurkhya-e2etesting/providers/Microsoft.Networks/virtualNetworks/test-vnet/subnets/appsubnet\\",\\"virtualMachine\
Configuration\\":{\\"imageReference\\":{\\"offer\\":\\"RHEL-SAP\\",\\"publisher\\":\\"RedHat\\",\\"sku\\":\\"7.4\\",\\"\
version\\":\\"7.4.2019062505\\"},\\"osProfile\\":{\\"adminUsername\\":\\"{your-username}\\",\\"osConfiguration\\":{\\"d\
isablePasswordAuthentication\\":true,\\"osType\\":\\"Linux\\",\\"ssh\\":{\\"publicKeys\\":[{\\"keyData\\":\\"ssh-rsa \
public key\\"}]}}},\\"vmSize\\":\\"Standard_E32ds_v4\\"}},\\"centralServer\\":{\\"instanceCount\\":2,\\"subnetId\\":\\"\
/subscriptions/49d64d54-e966-4c46-a868-1999802b762c/resourceGroups/dindurkhya-e2etesting/providers/Microsoft.Networks/v\
irtualNetworks/test-vnet/subnets/appsubnet\\",\\"virtualMachineConfiguration\\":{\\"imageReference\\":{\\"offer\\":\\"R\
HEL-SAP\\",\\"publisher\\":\\"RedHat\\",\\"sku\\":\\"7.4\\",\\"version\\":\\"7.4.2019062505\\"},\\"osProfile\\":{\\"adm\
inUsername\\":\\"{your-username}\\",\\"osConfiguration\\":{\\"disablePasswordAuthentication\\":true,\\"osType\\":\\"Lin\
ux\\",\\"ssh\\":{\\"publicKeys\\":[{\\"keyData\\":\\"ssh-rsa public key\\"}]}}},\\"vmSize\\":\\"Standard_E16ds_v4\\"}},\
\\"databaseServer\\":{\\"databaseType\\":\\"HANA\\",\\"instanceCount\\":2,\\"subnetId\\":\\"/subscriptions/49d64d54-e96\
6-4c46-a868-1999802b762c/resourceGroups/dindurkhya-e2etesting/providers/Microsoft.Networks/virtualNetworks/test-vnet/su\
bnets/dbsubnet\\",\\"virtualMachineConfiguration\\":{\\"imageReference\\":{\\"offer\\":\\"RHEL-SAP\\",\\"publisher\\":\
\\"RedHat\\",\\"sku\\":\\"7.4\\",\\"version\\":\\"7.4.2019062505\\"},\\"osProfile\\":{\\"adminUsername\\":\\"{your-user\
name}\\",\\"osConfiguration\\":{\\"disablePasswordAuthentication\\":true,\\"osType\\":\\"Linux\\",\\"ssh\\":{\\"publicK\
eys\\":[{\\"keyData\\":\\"ssh-rsa public key\\"}]}}},\\"vmSize\\":\\"Standard_M32ts\\"}},\\"deploymentType\\":\\"ThreeT\
ier\\",\\"highAvailabilityConfig\\":{\\"highAvailabilityType\\":\\"AvailabilityZone\\"}}}" --environment "Prod" \
--sap-product "S4HANA" --resource-group "test-rg" --sap-virtual-instance-name "X00"
az workloads sap-virtual-instance create --location "westcentralus" --configuration "{\\"appLocation\\":\\"eastus\\",\\\
"configurationType\\":\\"Deployment\\",\\"infrastructureConfiguration\\":{\\"appResourceGroup\\":\\"X00-RG\\",\\"databa\
seType\\":\\"HANA\\",\\"deploymentType\\":\\"SingleServer\\",\\"networkConfiguration\\":{\\"isSecondaryIpEnabled\\":tru\
e},\\"subnetId\\":\\"/subscriptions/49d64d54-e966-4c46-a868-1999802b762c/resourceGroups/dindurkhya-e2etesting/providers\
/Microsoft.Networks/virtualNetworks/test-vnet/subnets/appsubnet\\",\\"virtualMachineConfiguration\\":{\\"imageReference\
\\":{\\"offer\\":\\"RHEL-SAP\\",\\"publisher\\":\\"RedHat\\",\\"sku\\":\\"7.4\\",\\"version\\":\\"7.4.2019062505\\"},\\\
"osProfile\\":{\\"adminUsername\\":\\"{your-username}\\",\\"osConfiguration\\":{\\"disablePasswordAuthentication\\":tru\
e,\\"osType\\":\\"Linux\\",\\"ssh\\":{\\"publicKeys\\":[{\\"keyData\\":\\"ssh-rsa public \
key\\"}]}}},\\"vmSize\\":\\"Standard_E32ds_v4\\"}}}" --environment "NonProd" --sap-product "S4HANA" --resource-group \
"test-rg" --sap-virtual-instance-name "X00"
az workloads sap-virtual-instance create --location "westcentralus" --configuration "{\\"appLocation\\":\\"eastus\\",\\\
"configurationType\\":\\"DeploymentWithOSConfig\\",\\"infrastructureConfiguration\\":{\\"appResourceGroup\\":\\"X00-RG\
\\",\\"applicationServer\\":{\\"instanceCount\\":6,\\"subnetId\\":\\"/subscriptions/49d64d54-e966-4c46-a868-1999802b762\
c/resourceGroups/dindurkhya-e2etesting/providers/Microsoft.Networks/virtualNetworks/test-vnet/subnets/appsubnet\\",\\"v\
irtualMachineConfiguration\\":{\\"imageReference\\":{\\"offer\\":\\"RHEL-SAP\\",\\"publisher\\":\\"RedHat\\",\\"sku\\":\
\\"7.4\\",\\"version\\":\\"7.4.2019062505\\"},\\"osProfile\\":{\\"adminUsername\\":\\"{your-username}\\",\\"osConfigura\
tion\\":{\\"disablePasswordAuthentication\\":true,\\"osType\\":\\"Linux\\",\\"sshKeyPair\\":{\\"privateKey\\":\\"xyz\\"\
,\\"publicKey\\":\\"abc\\"}}},\\"vmSize\\":\\"Standard_E32ds_v4\\"}},\\"centralServer\\":{\\"instanceCount\\":1,\\"subn\
etId\\":\\"/subscriptions/49d64d54-e966-4c46-a868-1999802b762c/resourceGroups/dindurkhya-e2etesting/providers/Microsoft\
.Networks/virtualNetworks/test-vnet/subnets/appsubnet\\",\\"virtualMachineConfiguration\\":{\\"imageReference\\":{\\"of\
fer\\":\\"RHEL-SAP\\",\\"publisher\\":\\"RedHat\\",\\"sku\\":\\"7.4\\",\\"version\\":\\"7.4.2019062505\\"},\\"osProfile\
\\":{\\"adminUsername\\":\\"{your-username}\\",\\"osConfiguration\\":{\\"disablePasswordAuthentication\\":true,\\"osTyp\
e\\":\\"Linux\\",\\"sshKeyPair\\":{\\"privateKey\\":\\"xyz\\",\\"publicKey\\":\\"abc\\"}}},\\"vmSize\\":\\"Standard_E16\
ds_v4\\"}},\\"databaseServer\\":{\\"databaseType\\":\\"HANA\\",\\"instanceCount\\":1,\\"subnetId\\":\\"/subscriptions/4\
9d64d54-e966-4c46-a868-1999802b762c/resourceGroups/dindurkhya-e2etesting/providers/Microsoft.Networks/virtualNetworks/t\
est-vnet/subnets/dbsubnet\\",\\"virtualMachineConfiguration\\":{\\"imageReference\\":{\\"offer\\":\\"RHEL-SAP\\",\\"pub\
lisher\\":\\"RedHat\\",\\"sku\\":\\"7.4\\",\\"version\\":\\"7.4.2019062505\\"},\\"osProfile\\":{\\"adminUsername\\":\\"\
{your-username}\\",\\"osConfiguration\\":{\\"disablePasswordAuthentication\\":true,\\"osType\\":\\"Linux\\",\\"sshKeyPa\
ir\\":{\\"privateKey\\":\\"xyz\\",\\"publicKey\\":\\"abc\\"}}},\\"vmSize\\":\\"Standard_M32ts\\"}},\\"deploymentType\\"\
:\\"ThreeTier\\"},\\"osSapConfiguration\\":{\\"deployerVmPackages\\":{\\"storageAccountId\\":\\"/subscriptions/49d64d54\
-e966-4c46-a868-1999802b762c/resourceGroups/yb-SapInstall/providers/Microsoft.Storage/storageAccounts/ybteststorageacco\
unt\\",\\"url\\":\\"https://ybteststorageaccount.blob.core.windows.net/sapbits/deployervmpackages/DeployerVMPackages.zi\
p\\"},\\"sapFqdn\\":\\"xyz.test.com\\"}}" --environment "Prod" --sap-product "S4HANA" --resource-group "test-rg" \
--sap-virtual-instance-name "X00"
az workloads sap-virtual-instance create --location "westcentralus" --configuration "{\\"appLocation\\":\\"eastus\\",\\\
"configurationType\\":\\"DeploymentWithOSConfig\\",\\"infrastructureConfiguration\\":{\\"appResourceGroup\\":\\"X00-RG\
\\",\\"applicationServer\\":{\\"instanceCount\\":6,\\"subnetId\\":\\"/subscriptions/49d64d54-e966-4c46-a868-1999802b762\
c/resourceGroups/dindurkhya-e2etesting/providers/Microsoft.Networks/virtualNetworks/test-vnet/subnets/appsubnet\\",\\"v\
irtualMachineConfiguration\\":{\\"imageReference\\":{\\"offer\\":\\"RHEL-SAP\\",\\"publisher\\":\\"RedHat\\",\\"sku\\":\
\\"7.4\\",\\"version\\":\\"7.4.2019062505\\"},\\"osProfile\\":{\\"adminUsername\\":\\"{your-username}\\",\\"osConfigura\
tion\\":{\\"disablePasswordAuthentication\\":true,\\"osType\\":\\"Linux\\",\\"sshKeyPair\\":{\\"privateKey\\":\\"xyz\\"\
,\\"publicKey\\":\\"abc\\"}}},\\"vmSize\\":\\"Standard_E32ds_v4\\"}},\\"centralServer\\":{\\"instanceCount\\":2,\\"subn\
etId\\":\\"/subscriptions/49d64d54-e966-4c46-a868-1999802b762c/resourceGroups/dindurkhya-e2etesting/providers/Microsoft\
.Networks/virtualNetworks/test-vnet/subnets/appsubnet\\",\\"virtualMachineConfiguration\\":{\\"imageReference\\":{\\"of\
fer\\":\\"RHEL-SAP\\",\\"publisher\\":\\"RedHat\\",\\"sku\\":\\"7.4\\",\\"version\\":\\"7.4.2019062505\\"},\\"osProfile\
\\":{\\"adminUsername\\":\\"{your-username}\\",\\"osConfiguration\\":{\\"disablePasswordAuthentication\\":true,\\"osTyp\
e\\":\\"Linux\\",\\"sshKeyPair\\":{\\"privateKey\\":\\"xyz\\",\\"publicKey\\":\\"abc\\"}}},\\"vmSize\\":\\"Standard_E16\
ds_v4\\"}},\\"databaseServer\\":{\\"databaseType\\":\\"HANA\\",\\"instanceCount\\":2,\\"subnetId\\":\\"/subscriptions/4\
9d64d54-e966-4c46-a868-1999802b762c/resourceGroups/dindurkhya-e2etesting/providers/Microsoft.Networks/virtualNetworks/t\
est-vnet/subnets/dbsubnet\\",\\"virtualMachineConfiguration\\":{\\"imageReference\\":{\\"offer\\":\\"RHEL-SAP\\",\\"pub\
lisher\\":\\"RedHat\\",\\"sku\\":\\"7.4\\",\\"version\\":\\"7.4.2019062505\\"},\\"osProfile\\":{\\"adminUsername\\":\\"\
{your-username}\\",\\"osConfiguration\\":{\\"disablePasswordAuthentication\\":true,\\"osType\\":\\"Linux\\",\\"sshKeyPa\
ir\\":{\\"privateKey\\":\\"xyz\\",\\"publicKey\\":\\"abc\\"}}},\\"vmSize\\":\\"Standard_M32ts\\"}},\\"deploymentType\\"\
:\\"ThreeTier\\",\\"highAvailabilityConfig\\":{\\"highAvailabilityType\\":\\"AvailabilitySet\\"}},\\"osSapConfiguration\
\\":{\\"deployerVmPackages\\":{\\"storageAccountId\\":\\"/subscriptions/49d64d54-e966-4c46-a868-1999802b762c/resourceGr\
oups/yb-SapInstall/providers/Microsoft.Storage/storageAccounts/ybteststorageaccount\\",\\"url\\":\\"https://ybteststora\
geaccount.blob.core.windows.net/sapbits/deployervmpackages/DeployerVMPackages.zip\\"},\\"sapFqdn\\":\\"xyz.test.com\\"}\
}" --environment "Prod" --sap-product "S4HANA" --resource-group "test-rg" --sap-virtual-instance-name "X00"
az workloads sap-virtual-instance create --location "westcentralus" --configuration "{\\"appLocation\\":\\"eastus\\",\\\
"configurationType\\":\\"DeploymentWithOSConfig\\",\\"infrastructureConfiguration\\":{\\"appResourceGroup\\":\\"X00-RG\
\\",\\"applicationServer\\":{\\"instanceCount\\":6,\\"subnetId\\":\\"/subscriptions/49d64d54-e966-4c46-a868-1999802b762\
c/resourceGroups/dindurkhya-e2etesting/providers/Microsoft.Networks/virtualNetworks/test-vnet/subnets/appsubnet\\",\\"v\
irtualMachineConfiguration\\":{\\"imageReference\\":{\\"offer\\":\\"RHEL-SAP\\",\\"publisher\\":\\"RedHat\\",\\"sku\\":\
\\"7.4\\",\\"version\\":\\"7.4.2019062505\\"},\\"osProfile\\":{\\"adminUsername\\":\\"{your-username}\\",\\"osConfigura\
tion\\":{\\"disablePasswordAuthentication\\":true,\\"osType\\":\\"Linux\\",\\"sshKeyPair\\":{\\"privateKey\\":\\"xyz\\"\
,\\"publicKey\\":\\"abc\\"}}},\\"vmSize\\":\\"Standard_E32ds_v4\\"}},\\"centralServer\\":{\\"instanceCount\\":2,\\"subn\
etId\\":\\"/subscriptions/49d64d54-e966-4c46-a868-1999802b762c/resourceGroups/dindurkhya-e2etesting/providers/Microsoft\
.Networks/virtualNetworks/test-vnet/subnets/appsubnet\\",\\"virtualMachineConfiguration\\":{\\"imageReference\\":{\\"of\
fer\\":\\"RHEL-SAP\\",\\"publisher\\":\\"RedHat\\",\\"sku\\":\\"7.4\\",\\"version\\":\\"7.4.2019062505\\"},\\"osProfile\
\\":{\\"adminUsername\\":\\"{your-username}\\",\\"osConfiguration\\":{\\"disablePasswordAuthentication\\":true,\\"osTyp\
e\\":\\"Linux\\",\\"sshKeyPair\\":{\\"privateKey\\":\\"xyz\\",\\"publicKey\\":\\"abc\\"}}},\\"vmSize\\":\\"Standard_E16\
ds_v4\\"}},\\"databaseServer\\":{\\"databaseType\\":\\"HANA\\",\\"instanceCount\\":2,\\"subnetId\\":\\"/subscriptions/4\
9d64d54-e966-4c46-a868-1999802b762c/resourceGroups/dindurkhya-e2etesting/providers/Microsoft.Networks/virtualNetworks/t\
est-vnet/subnets/dbsubnet\\",\\"virtualMachineConfiguration\\":{\\"imageReference\\":{\\"offer\\":\\"RHEL-SAP\\",\\"pub\
lisher\\":\\"RedHat\\",\\"sku\\":\\"7.4\\",\\"version\\":\\"7.4.2019062505\\"},\\"osProfile\\":{\\"adminUsername\\":\\"\
{your-username}\\",\\"osConfiguration\\":{\\"disablePasswordAuthentication\\":true,\\"osType\\":\\"Linux\\",\\"sshKeyPa\
ir\\":{\\"privateKey\\":\\"xyz\\",\\"publicKey\\":\\"abc\\"}}},\\"vmSize\\":\\"Standard_M32ts\\"}},\\"deploymentType\\"\
:\\"ThreeTier\\",\\"highAvailabilityConfig\\":{\\"highAvailabilityType\\":\\"AvailabilityZone\\"}},\\"osSapConfiguratio\
n\\":{\\"deployerVmPackages\\":{\\"storageAccountId\\":\\"/subscriptions/49d64d54-e966-4c46-a868-1999802b762c/resourceG\
roups/yb-SapInstall/providers/Microsoft.Storage/storageAccounts/ybteststorageaccount\\",\\"url\\":\\"https://ybteststor\
ageaccount.blob.core.windows.net/sapbits/deployervmpackages/DeployerVMPackages.zip\\"},\\"sapFqdn\\":\\"xyz.test.com\\"\
}}" --environment "Prod" --sap-product "S4HANA" --resource-group "test-rg" --sap-virtual-instance-name "X00"
az workloads sap-virtual-instance create --location "westcentralus" --configuration "{\\"appLocation\\":\\"eastus\\",\\\
"configurationType\\":\\"DeploymentWithOSConfig\\",\\"infrastructureConfiguration\\":{\\"appResourceGroup\\":\\"X00-RG\
\\",\\"databaseType\\":\\"HANA\\",\\"deploymentType\\":\\"SingleServer\\",\\"networkConfiguration\\":{\\"isSecondaryIpE\
nabled\\":true},\\"subnetId\\":\\"/subscriptions/49d64d54-e966-4c46-a868-1999802b762c/resourceGroups/dindurkhya-e2etest\
ing/providers/Microsoft.Networks/virtualNetworks/test-vnet/subnets/appsubnet\\",\\"virtualMachineConfiguration\\":{\\"i\
mageReference\\":{\\"offer\\":\\"RHEL-SAP\\",\\"publisher\\":\\"RedHat\\",\\"sku\\":\\"7.4\\",\\"version\\":\\"7.4.2019\
062505\\"},\\"osProfile\\":{\\"adminUsername\\":\\"{your-username}\\",\\"osConfiguration\\":{\\"disablePasswordAuthenti\
cation\\":true,\\"osType\\":\\"Linux\\",\\"sshKeyPair\\":{\\"privateKey\\":\\"xyz\\",\\"publicKey\\":\\"abc\\"}}},\\"vm\
Size\\":\\"Standard_E32ds_v4\\"}},\\"osSapConfiguration\\":{\\"deployerVmPackages\\":{\\"storageAccountId\\":\\"/subscr\
iptions/49d64d54-e966-4c46-a868-1999802b762c/resourceGroups/yb-SapInstall/providers/Microsoft.Storage/storageAccounts/y\
bteststorageaccount\\",\\"url\\":\\"https://ybteststorageaccount.blob.core.windows.net/sapbits/deployervmpackages/Deplo\
yerVMPackages.zip\\"},\\"sapFqdn\\":\\"xyz.test.com\\"}}" --environment "NonProd" --sap-product "S4HANA" \
--resource-group "test-rg" --sap-virtual-instance-name "X00"
```
##### <a name="ParametersSAPVirtualInstancesCreate">Parameters</a> 
|Option|Type|Description|Path (SDK)|Swagger name|
|------|----|-----------|----------|------------|
|**--resource-group-name**|string|The name of the resource group. The name is case insensitive.|resource_group_name|resourceGroupName|
|**--sap-virtual-instance-name**|string|The name of the Virtual Instances for SAP.|sap_virtual_instance_name|sapVirtualInstanceName|
|**--location**|string|The geo-location where the resource lives|location|location|
|**--environment**|choice|Defines the environment type - Production/Non Production.|environment|environment|
|**--sap-product**|choice|Defines the SAP Product type.|sap_product|sapProduct|
|**--configuration**|object|Defines if an existing SAP system is being registered or a new SAP system is being created|configuration|configuration|
|**--tags**|dictionary|Resource tags.|tags|tags|
|**--name**|string|Managed resource group name|name|name|
|**--type**|choice|Type of manage identity|type|type|
|**--user-assigned-identities**|dictionary|User assigned identities dictionary|user_assigned_identities|userAssignedIdentities|

#### <a name="SAPVirtualInstancesUpdate">Command `az workloads sap-virtual-instance update`</a>

##### <a name="ExamplesSAPVirtualInstancesUpdate">Example</a>
```
az workloads sap-virtual-instance update --type "None" --tags key1="svi1" --resource-group "test-rg" --name "X00"
```
##### <a name="ParametersSAPVirtualInstancesUpdate">Parameters</a> 
|Option|Type|Description|Path (SDK)|Swagger name|
|------|----|-----------|----------|------------|
|**--resource-group-name**|string|The name of the resource group. The name is case insensitive.|resource_group_name|resourceGroupName|
|**--sap-virtual-instance-name**|string|The name of the Virtual Instances for SAP.|sap_virtual_instance_name|sapVirtualInstanceName|
|**--tags**|dictionary|Gets or sets the Resource tags.|tags|tags|
|**--type**|choice|Type of manage identity|type|type|
|**--user-assigned-identities**|dictionary|User assigned identities dictionary|user_assigned_identities|userAssignedIdentities|

#### <a name="SAPVirtualInstancesDelete">Command `az workloads sap-virtual-instance delete`</a>

##### <a name="ExamplesSAPVirtualInstancesDelete">Example</a>
```
az workloads sap-virtual-instance delete --resource-group "test-rg" --name "X00"
```
##### <a name="ParametersSAPVirtualInstancesDelete">Parameters</a> 
|Option|Type|Description|Path (SDK)|Swagger name|
|------|----|-----------|----------|------------|
|**--resource-group-name**|string|The name of the resource group. The name is case insensitive.|resource_group_name|resourceGroupName|
|**--sap-virtual-instance-name**|string|The name of the Virtual Instances for SAP.|sap_virtual_instance_name|sapVirtualInstanceName|

#### <a name="SAPVirtualInstancesStart">Command `az workloads sap-virtual-instance start`</a>

##### <a name="ExamplesSAPVirtualInstancesStart">Example</a>
```
az workloads sap-virtual-instance start --resource-group "test-rg" --name "X00"
```
##### <a name="ParametersSAPVirtualInstancesStart">Parameters</a> 
|Option|Type|Description|Path (SDK)|Swagger name|
|------|----|-----------|----------|------------|
|**--resource-group-name**|string|The name of the resource group. The name is case insensitive.|resource_group_name|resourceGroupName|
|**--sap-virtual-instance-name**|string|The name of the Virtual Instances for SAP.|sap_virtual_instance_name|sapVirtualInstanceName|

#### <a name="SAPVirtualInstancesStop">Command `az workloads sap-virtual-instance stop`</a>

##### <a name="ExamplesSAPVirtualInstancesStop">Example</a>
```
az workloads sap-virtual-instance stop --hard-stop false --resource-group "test-rg" --name "X00"
```
##### <a name="ParametersSAPVirtualInstancesStop">Parameters</a> 
|Option|Type|Description|Path (SDK)|Swagger name|
|------|----|-----------|----------|------------|
|**--resource-group-name**|string|The name of the resource group. The name is case insensitive.|resource_group_name|resourceGroupName|
|**--sap-virtual-instance-name**|string|The name of the Virtual Instances for SAP.|sap_virtual_instance_name|sapVirtualInstanceName|
|**--hard-stop**|boolean|A boolean to specify if the SAP system should be hard-stopped.|hard_stop|hardStop|
