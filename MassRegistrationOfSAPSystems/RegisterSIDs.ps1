#Run the below commands before using the script
#Connect-AzAccount -SubscriptionId 'yyyy-yyyy-yyyy-yyyy'

# Replace <filePath> to the input CSV file
$file = Import-CSV "C:\Users\jasksingh\Downloads\RegistrationData.csv"

$MonitoringIntervalInSeconds = 30

$Jobdefs = @()

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

    # Creating script block for parallel execution
    $ScriptBlockCopy = {
        param($ResourceGroup, $SID, $Location, $Environment, $Product, $CentralServerVmId, $ManagedRgName, $MsiID)
        New-AzWorkloadsSapVirtualInstance -ResourceGroupName $ResourceGroup -Name $SID -Location $Location -Environment $Environment -SapProduct $Product -CentralServerVmId $CentralServerVmId -ManagedResourceGroupName $ManagedRgName -IdentityType 'UserAssigned' -UserAssignedIdentity @{$MsiID=@{}}
    }

    # Generating Random String for Job Name
    $random = -join ((65..90) + (97..122) | Get-Random -Count 8 | % {[char]$_})

    # Starting Job
    Start-Job -ScriptBlock $ScriptBlockCopy -ArgumentList $ResourceGroup, $SID, $Location, $Environment, $Product, $CentralServerVmId, $ManagedRgName, $MsiID -Name $random

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

$Jobdefs | Format-Table -AutoSize

# Replace <filePath> with the path of the output CSV file path 
$file | Export-Csv "C:\Users\jasksingh\Downloads\RegistrationData.csv" -Force -NoTypeInformation