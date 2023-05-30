#Run the below commands before using the script
#Connect-AzAccount -SubscriptionId 'yyyy-yyyy-yyyy-yyyy'

# Replace <filePath> to the input CSV file
$file = Import-CSV "<filePath>"

# Monitoring Interval in seconds
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
    $Jobdefs += New-Object PSCustomObject -Property @{JobName = $random; SID = $SID}
}

$Completed = [System.Collections.ArrayList]::new()

while($Completed.Count -ne ($Jobdefs | Measure-Object).Count)
{
    Write-Host "Complete count is $($Completed.Count) and total count is $(($Jobdefs | Measure-Object).Count)"
    Start-Sleep -Seconds $MonitoringIntervalInSeconds

    foreach($Jobdef in $Jobdefs)
    {
        $Jobdef.JobName
        if($Completed.Contains($Jobdef.JobName))
        {
            continue
        }
    
        $Job = Get-Job -Name $($Jobdef.JobName)

        if($Job.State -ne "Running")
        {
            $Out = Receive-Job -Name $($Jobdef.JobName) | ConvertFrom-Json

            Write-Host "The registration for $($Jobdef.SID) completed with provisioning state $($Out.properties.ProvisioningState)"

            $Completed.Add($Jobdef.JobName)

        }

        Write-Host "Registration completed for $($Completed.Count) SIDs"
    }
}