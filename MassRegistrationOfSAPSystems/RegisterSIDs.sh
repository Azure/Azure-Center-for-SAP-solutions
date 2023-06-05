#!/bin/bash

#Run the below commands before using the script
#az login
#az account set --subscription "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"

# Replace <filePath> to the input CSV file path
inputfile="<filePath>"

MaxParallelJobs=2

results=''
pids=''
sids=''

echo "Starting the Registration of SAP Systems"
while IFS="," read -r SID Location Environment Product CentralServerVmId MsiId ManagedResourceGroupName ManagedRgStorageAccountName Tag State
do
    ResourceGroup=`echo ${CentralServerVmId} | cut -f5 -d'/'`
    Configuration=`echo "{\"configurationType\":\"Discovery\",\"centralServerVmId\":\"${CentralServerVmId}\"}"`
    userAssignedMSI=`echo "{type:UserAssigned,userAssignedIdentities:{${MsiId}:{}}}"`
    # Tagstring=`echo $Tag | sed 's/ //g' | sed 's/;/\" \"/g' | sed 's/^/\"/g' | sed 's/$/\"/g'`
    Tagstring=`echo $Tag | sed 's/ //g' | sed 's/;/ /g'`
    while :
    do
        if [[ `pgrep "az workloads sap-virtual-instance create" -c` -le $MaxParallelJobs ]];
        then
            az workloads sap-virtual-instance create --resource-group $ResourceGroup --name $SID --environment $Environment --sap-product $Product --configuration $Configuration --identity $userAssignedMSI --location $Location --managed-rg-name $ManagedResourceGroupName --tags $Tagstring > /dev/null 2>&1 &
            pid=$!
            pids="${pids} ${pid}"
            echo "Started the registration of ${SID} with PID ${pid}"
            break
        else
            echo "Reached maximum parallel jobs, waiting for 30 seconds"
            sleep 30
        fi
    done    
    sids="${sids} ${SID}"
done < <(cat ${inputfile} | tail -n +2)
echo "Waiting for the process to Complete"
for pid in $pids
do
    wait $pid
    result=$?
    results="$results $result"
done

i=0
for sid in $sids; do
    ((i++))
    echo "Registration for ${sid} completed with result `echo ${results}|cut -f$i -d' '`"
done
