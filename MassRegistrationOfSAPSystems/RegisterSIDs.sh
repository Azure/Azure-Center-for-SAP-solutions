#!/bin/bash

#Run the below commands before using the script
#az login
#az account set --subscription "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"

# Replace <filePath> to the input CSV file path
csvfile="<filePath>"

results=''
pids=''
sids=''

echo "Starting the Registration of SAP Systems"
while IFS="," read -r SID Location Environment Product CentralServerVmId MsiId ManagedResourceGroupName State
do
    ResourceGroup=`echo ${CentralServerVmId} | cut -f5 -d'/'`
    Configuration=`echo "{\"configurationType\":\"Discovery\",\"centralServerVmId\":\"${CentralServerVmId}\"}"`
    userAssignedMSI=`echo "{type:UserAssigned,userAssignedIdentities:{${MsiID}:{}}}"`
    az workloads sap-virtual-instance create -g $ResourceGroup -n $SID --environment $Environment --sap-product $Product --configuration $Configuration --identity $userAssignedMSI > /dev/null 2>&1 &
    pid=$!
    pids="${pids} ${pid}"
    echo "Started the registration of ${SID} with PID ${pid}"
    sids="${sids} ${SID}"
done < <(cat ${csvfile} | tail -n +2)
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
