# ---------------------------------------------------------------------------------- 
    # Copyright (c) Microsoft Corporation. All rights reserved.
    # Licensed under the MIT License. See License in the project root for
    # license information.
# ----------------------------------------------------------------------------------

#Run the below commands before using the script
#Connect-AzAccount -SubscriptionId 'yyyy-yyyy-yyyy-yyyy'

# Replace <filePath> to the input CSV file
$inputfile = "<filePath>"

# Replace <filePath> to the output CSV file
$outputfile = "<filePath>"

# Specify the number of seconds to monitor the job status
$MonitoringIntervalInSeconds = 30

# Specify the maximum number of parallel jobs to run
$MaxParallelJobs = 10

$Jobdefs = @()

$file = Import-CSV $inputfile

foreach($line in $file)
{ 
    # Getting deployment specific values
    $SID = $line.SID
    $Location = $line.Location
    $Environment = $line.Environment
    $Product = $line.Product
    $CentralServerVmId = $line.CentralServerVmId
    $ResourceGroup = $CentralServerVmId.Split("/")[4]
    $MsiID = $line.MsiId
    $ManagedRgName = $line.ManagedResourceGroupName
    $ManagedRgStorageAccountName = $line.ManagedRgStorageAccountName
    $TagVals = ($line.Tag -replace '\s','').Split(";")
    $Keys=@()
    $Values=@()

    # Creating Tag Hash Table
    foreach($TagVal in $TagVals)
    {
        $SubTag = $TagVal.Split("=")
        $Keys += $SubTag[0]
        $Values += $SubTag[1]
    }
    $i=0
    $Tag = @{}
    foreach($Key in $Keys)
    {
        $Tag += @{$Key=$Values[$i]}
        $i++
    }
    # Creating script block for parallel execution
    $ScriptBlockCopy = {
        param($ResourceGroup, $SID, $Location, $Environment, $Product, $CentralServerVmId, $ManagedRgName, $MsiID, $Tag, $ManagedRgStorageAccountName)
        New-AzWorkloadsSapVirtualInstance -ResourceGroupName $ResourceGroup -Name $SID -Location $Location -Environment $Environment -SapProduct $Product -CentralServerVmId $CentralServerVmId -ManagedResourceGroupName $ManagedRgName -IdentityType 'UserAssigned' -UserAssignedIdentity @{$MsiID=@{}} -Tag $Tag -ManagedRgStorageAccountName $ManagedRgStorageAccountName
    }

    # Generating Random String for Job Name
    $random = -join ((65..90) + (97..122) | Get-Random -Count 8 | % {[char]$_})

    # Starting Job
    while ($true) {
        if ((Get-Job -State Running).Count -le $MaxParallelJobs)
        {
            Start-Job -ScriptBlock $ScriptBlockCopy -ArgumentList $ResourceGroup, $SID, $Location, $Environment, $Product, $CentralServerVmId, $ManagedRgName, $MsiID, $Tag, $ManagedRgStorageAccountName -Name $random
            break
        }
        else
        {
            Write-Host "Reached maximum parallel jobs, waiting for 30 seconds"
            Start-Sleep -Seconds $MonitoringIntervalInSeconds
        }
    }

    # Storing Job Definitions
    $Jobdefs += New-Object PSCustomObject -Property @{JobName = $random; SID = $SID; State = "Running"}
}

Write-Host "Waiting for all jobs to complete"

$Completed = [System.Collections.ArrayList]::new()

while($Completed.Count -ne ($Jobdefs | Measure-Object).Count)
{
    Start-Sleep -Seconds $MonitoringIntervalInSeconds

    Write-Host "$($Completed.Count) Jobs completed out of $(($Jobdefs | Measure-Object).Count)"

    foreach($Jobdef in $Jobdefs)
    {

        if($Completed.Contains($Jobdef.JobName))
        {
            continue
        }
    
        $Job = Get-Job -Name $($Jobdef.JobName)

        if($Job.State -ne "Running")
        {
            $Out = Receive-Job -Name $($Jobdef.JobName) | ConvertFrom-Json

            Write-Host "The registration for $($Jobdef.SID) completed with provisioning state as $($Out.properties.ProvisioningState)"

            $null = $Completed.Add($Jobdef.JobName)
            
            $filerec = $file | Where-Object {$_.SID -eq $Jobdef.SID}

            $filerec.State = $Out.properties.ProvisioningState
            
            $Jobrec = $Jobdefs | Where-Object {$_.SID -eq $Jobdef.SID}
            
            $Jobrec.State = $Job.State

        }
    }
}

# Outputting the results
$Jobdefs | Format-Table -AutoSize

# Exporting the results to CSV
$file | Export-Csv $outputfile -Force -NoTypeInformation