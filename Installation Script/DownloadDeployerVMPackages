# <copyright file="DownloadDeployerVMPackages.sh" company="Microsoft Corporation">
# Copyright (c) Microsoft Corporation. All rights reserved.
# </copyright>

#!/bin/bash

#Exit when any command fails
set -e

#download packages locally

workloadWorkdir=DeployerVMPackages

if [[ ! -d "$workloadWorkdir" ]]; then
        mkdir $workloadWorkdir
fi

if [[ ! -d "$workloadWorkdir/packages" ]]; then
        mkdir $workloadWorkdir/packages
fi

#download python3-pip
cd $workloadWorkdir/packages

if [[ ! -f "pip-21.3.1.tar.gz" ]]; then
        wget -nv -q https://files.pythonhosted.org/packages/da/f6/c83229dcc3635cdeb51874184241a9508ada15d8baa337a41093fab58011/pip-21.3.1.tar.gz
        tar -xvf pip-21.3.1.tar.gz
fi

cd pip-21.3.1/

#Check if pip3 is already installed
if [[ -z $(which pip3) ]]; then
        #Install pip
        echo "Installing pip3."
        sudo python3 setup.py install
fi

cd ../../..
#download wheel
pip3 download -d $workloadWorkdir/packages wheel==0.37.1


#download jq 1.6
if [[ ! -d "$workloadWorkdir/jq_pkg" ]]; then
        mkdir $workloadWorkdir/jq_pkg
fi

cd $workloadWorkdir/jq_pkg
wget -O jq https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64
chmod +x jq

cd -
#download ansible
if [[ ! -d "$workloadWorkdir/ansible_pkg" ]]; then
        mkdir $workloadWorkdir/ansible_pkg
fi
pip3 download -d $workloadWorkdir/ansible_pkg "ansible==2.9.27"

#download azure cli libraries
if [[ ! -d "$workloadWorkdir/azure_cli_pkg" ]]; then
        mkdir $workloadWorkdir/azure_cli_pkg
fi

cd $workloadWorkdir/azure_cli_pkg
wget -nv -q https://raw.githubusercontent.com/Azure/azure-cli/azure-cli-2.30.0/src/azure-cli/requirements.py3.Linux.txt

cd -
if [[ ! -d "$workloadWorkdir/azure_cli_pkg/azure_cli_requirements" ]]; then
        mkdir $workloadWorkdir/azure_cli_pkg/azure_cli_requirements
fi

pip3 download -r $workloadWorkdir/azure_cli_pkg/requirements.py3.Linux.txt -d $workloadWorkdir/azure_cli_pkg/azure_cli_requirements

#Check if zip is already installed
if [[ -z $(which zip) ]]; then
        echo "Installing zip package."
        #Install zip
        sudo apt-get --assume-yes install zip
fi

zip -r $workloadWorkdir.zip $workloadWorkdir

#Check if user have an existing storage account
echo "Do you have an existing storage account?"
echo -n "y/n: "
read -r userInput

if [[ ${userInput^^} == "Y" ]]; then
        #sapbits_location_base_path  
        echo "Enter the SAP storage account base path(sapbits-location-base-path) url copied from storage container properties. This is the storage container where SAP installation bits and deployer vm packages are stored/will be stored."
        read -r sapbits_location_base_path

        #check if customer entered an empty string
        while [ -z $sapbits_location_base_path ]
        do    
            echo "Empty sapbits-location-base-path given, please re-enter the SAP storage account base path(sapbits-location-base-path) url else press 'Ctrl+C' or type 'exit' to end the process."
            read -r sapbits_location_base_path

            if [[ ${sapbits_location_base_path^^} == "EXIT" ]]; then
                    exit 1
            fi
        done
        IFS='//'
        read -ra arr <<< $sapbits_location_base_path 
        container=${arr[3]} 

        IFS='.'
        read -ra arr <<< ${arr[2]}
        storageAccountName=${arr[0]} 

        #Fetch container name
        IFS='"'
        read -ra arr <<< $container
        containerName=${arr[0]}
else
        #Storage account name
        echo "Enter the new storage account name you want to create."
        read -r storageAccountName
        while [ -z $storageAccountName ]
        do    
            echo "Empty storage account name given, please re-enter the storage account name else press 'Ctrl+C' or type 'exit' to end the process."
            read -r storageAccountName

            if [[ ${storageAccountName^^} == "EXIT" ]]; then
                    exit 2
            fi
        done  

        #Check subscription
        subscription=$(az account show --query name)
        echo "Current subscription is $subscription, do you want to change the subscription? This is the subscription where storage account will be created."
        echo -n "y/n: "
        read -r userInput

        if [[ ${userInput^^} == "Y" ]]; then
                echo "Enter the new subscription name or id. (Use az account list to get a list of subscriptions for the logged in account)."
                read -r subscription
                az account set --subscription "$subscription"
        fi

        echo "Do you want to use an existing resource group? This is the resource group where storage account will be created."
        echo -n "y/n: "
        read -r userInput
        if [[ ${userInput^^} == "Y" ]]; then
                echo "Enter the resource group name."
                read -r resourceGroupName
                while [ -z $resourceGroupName ]
                do    
                    echo "Empty resource group name given, please re-enter the resource group name else press 'Ctrl+C' or type 'exit' to end the process."
                    read -r resourceGroupName

                    if [[ ${resourceGroupName^^} == "EXIT" ]]; then
                            exit 3
                    fi
                done
        else
                echo "Enter the new resource group name to create a new resource group."
                read -r resourceGroupName
                while [ -z $resourceGroupName ]
                do    
                    echo "Empty resource group name given, please re-enter the resource group name else press 'Ctrl+C' or type 'exit' to end the process."
                    read -r resourceGroupName

                    if [[ ${resourceGroupName^^} == "EXIT" ]]; then
                            exit 4
                    fi
                done

                echo "Enter the location where you want to create resource group."
                read -r resourceGroupLocation
                while [ -z $resourceGroupLocation ]
                do    
                    echo "Empty resource group locaion given, please re-enter the resource group name else press 'Ctrl+C' or type 'exit' to end the process."
                    read -r resourceGroupLocation

                    if [[ ${resourceGroupLocation^^} == "EXIT" ]]; then
                            exit 5
                    fi
                done
                az group create --location $resourceGroupLocation --name $resourceGroupName
        fi

        echo "Creating storage account $storageAccountName in resource group $resourceGroupName and subscription $subscription"
        az storage account create --name $storageAccountName --resource-group $resourceGroupName

        #Container name
        echo "Enter the new container name you want to create."
        read -r containerName
        while [ -z $containerName ]
        do    
            echo "Empty container name given, please re-enter the container name else press 'Ctrl+C' or type 'exit' to end the process."
            read -r containerName

            if [[ ${containerName^^} == "EXIT" ]]; then
                    exit 6
            fi
        done
        
        echo "Create container $containerName in storage account $storageAccountName"
        az storage container create --name $containerName --account-name $storageAccountName
fi

#sapbits-access-key
echo "Enter the sapbits-access-key copied from storage account 'Access keys'."   
read -r sapbits_access_key

#Repeat while loop until customer enters a non empty sapbits-access-key
while [ -z $sapbits_access_key ]
do
    read -r sapbits_access_key
    echo "No sapbits-access-key detected, please re-enter the sapbits-access-key else press 'Ctrl+C' or type 'exit' to end the process."

    if [[ ${sapbits_access_key^^} == "EXIT" ]]; then
            exit 7
    fi
done
    
echo "Storage account name where deployer vm packages are stored/will be stored: $storageAccountName."
echo "Container name where deployer vm packages are stored/will be stored: $containerName/deployervmpackages."

isBlobExists=$(az storage blob exists --account-name $storageAccountName --account-key "$sapbits_access_key" --container-name $containerName/deployervmpackages --name $workloadWorkdir.zip --query exists)

if [[ $isBlobExists == "false" ]]; then
        #upload to storage account
        az storage blob upload --account-name $storageAccountName --account-key "$sapbits_access_key" --container-name $containerName/deployervmpackages --name $workloadWorkdir.zip --file $workloadWorkdir.zip --if-none-match "*" --no-progress
else
        echo "Existing blob $workloadWorkdir.zip found in storage account, do you want to update the blob?"
        echo -n "y/n: "
        read -r userInput

        if [[ ${userInput^^} == "Y" ]]; then
                #delete existing blob
                az storage blob delete --account-name $storageAccountName --account-key "$sapbits_access_key" --container-name $containerName/deployervmpackages --name $workloadWorkdir.zip
                az storage blob upload --account-name $storageAccountName --account-key "$sapbits_access_key" --container-name $containerName/deployervmpackages --name $workloadWorkdir.zip --file $workloadWorkdir.zip --if-none-match "*" --no-progress
        fi
fi

