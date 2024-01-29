# Define a parameter to accept the path to the JSON file
param(
    [string]$JsonFilePath
)

# Function to process the input JSON file and return the parsed data
function ProcessInputFile($JsonFilePath)
{
    # Check if the file path is provided
    if (-not $JsonFilePath) {
        Write-Host "Please provide the path to the JSON file using -JsonFilePath parameter."
        Exit
    }

    # Check if the file exists
    if (-not (Test-Path -Path $JsonFilePath -PathType Leaf)) {
        Write-Host "The specified JSON file does not exist: $JsonFilePath"
        Exit
    }

    # Read and parse the JSON file
    $MigrationScriptInput = Get-Content -Path $JsonFilePath | ConvertFrom-Json
    Write-Host "Migration Script Input from $JsonFilePath- $MigrationScriptInput"
    return $MigrationScriptInput
}

# Function to get a list of SAP Virtual Instance (SVI) resource IDs based on the input
function GetListofResourceId($MigrationScriptInput)
{
    # Extract SubscriptionId from the input
    $SubscriptionId = $MigrationScriptInput.SubscriptionId

    # Initialize arrays to store SVIs for processing and those that cannot be processed
    $ProcessableSVIs = @()
    $UnprocessedSVIs = @()

    # Check if SubscriptionId is provided
    if ($SubscriptionId)
    {
        # Retrieve a list of all SVIs in the specified subscription
        $ListOfAllSVIs = Get-AzWorkloadsSapVirtualInstance -SubscriptionId $SubscriptionId

        # Iterate over the list of SVIs
        foreach ($svi in $ListOfAllSVIs) {
            # Access individual SVI properties
            $sviState = $svi.properties.state
            $sviId = $svi.id

            # Check if SVI is in a processable state
            if ($sviState -ieq "RegistrationComplete" -or $sviState -ieq "SoftwareInstallationPending")
            {
                $ProcessableSVIs+=$sviId
            }
            else {
                # Store details of unsupported SVIs
                $unsupportedSviDetails = @{
                    id = $svi.id
                    Reason = "UnsupportedProvisioningState: "+$sviState
                }
                $UnprocessedSVIs+=$unsupportedSviDetails
            }
        }
    }

    # Check if specific ResourceIds are provided in the input
    if ($MigrationScriptInput.ResourceIds)
    {
        # Iterate over the provided ResourceIds
        foreach ($id in $MigrationScriptInput.ResourceIds)
        {
            try
            {
                # Retrieve details of SVI using the provided ResourceId
                $sviDetails = Get-AzWorkloadsSapVirtualInstance -InputObject $id -ErrorAction Stop
            }
            catch
            {
                # Handle the case where SVI details cannot be retrieved
                $unsupportedSviDetails = @{
                    id = $sviId
                    Reason = $_.Exception.Message
                }
                $UnprocessedSVIs+=$unsupportedSviDetails
                continue
            }

            # Access individual SVI properties
            $sviState = $sviDetails.state

            # Check if SVI is in a processable state
            if ($sviState -ieq "RegistrationComplete" -or $sviState -ieq "SoftwareInstallationPending")
            {
                $ProcessableSVIs+=$sviDetails.id
            }
            else 
            {
                # Create a new object dynamically for unsupported SVIs
                $unsupportedSviDetails = @{
                    id = $sviDetails.id
                    Reason = "UnsupportedProvisioningState: $sviState"
                }
                $UnprocessedSVIs+=$unsupportedSviDetails
            }
        }
    }

    # Output the lists of processable and unprocessable SVIs to a text file
    $filePath = "sviStatus.txt"
    Set-Content -Path $filePath -Value "SVIs to be Processed::"
    foreach ($entry in $ProcessableSVIs) {
        Add-Content -Path $filePath -Value $entry
    }

    Add-Content -Path $filePath -Value "SVIs cannot be Processed::"
    foreach ($entry in $UnprocessedSVIs) {
        $output = "ID: " + $entry.id + ", Reason: " + $entry.Reason
        Add-Content -Path $filePath -Value $output
    }

    return $ProcessableSVIs
}

# Script block containing functions to patch SVIs
$PatchSVI = {
    function PatchSVIwithNetworkAccessType($resourceId, $networkAccessType)
    {
        try {
            # Attempt to patch SVI with network access type
            Write-Host "Patch SVI ManagedResourcesNetworkAccessType: '$networkAccessType' for ResourceId: $resourceId."
            $patchPrivate = Update-AzWorkloadsSapVirtualInstance -InputObject $resourceId -ManagedResourcesNetworkAccessType $networkAccessType
            Write-Host "Patch SVI Successful for $resourceId."
        }
        catch {
            Write-Host "An error occurred:"
            Write-Host $_
        }
    }

    function PatchSVIwithIdentityandNetworkAccessType($resourceId, $networkAccessType, $userAssignedidentity)
    {
        try {
            # Retrieve SVI and MSI details
            $svi = Get-AzWorkloadsSapVirtualInstance -InputObject $resourceId
            $msi = $svi.identity

            # Patch SVI with identity and network access type
            $patchNone = Update-AzWorkloadsSapVirtualInstance -InputObject $resourceId -IdentityType "None"

            Start-Sleep -Seconds 150
            Write-Host "Patch SVI ManagedResourcesNetworkAccessType: '$networkAccessType' for ResourceId: $resourceId."
            $patchPrivate = Update-AzWorkloadsSapVirtualInstance -InputObject $resourceId -IdentityType "UserAssigned" -ManagedResourcesNetworkAccessType $networkAccessType -UserAssignedIdentity @{ $userAssignedidentity = @{}; }
            Write-Host "Patch SVI Successful for $resourceId."
        }
        catch {
            Write-Host "An error occurred:"
            Write-Host $_
        }
    }
}

# Function to check if the required module exists, and install it if not
function CheckModuleExists
{
    if (Get-Module -ListAvailable -Name "Az.Workloads") {
        Write-Host "Az.Workloads exists"
    } 
    else {
        Write-Host "Module does not exist. Installing Module."
        Install-Module -Name Az.Workloads -AllowClobber -Force
    }
}

# Main function to orchestrate the script execution
function main
{
    # Check if Az.Workloads module exists or install it
    CheckModuleExists

    # Process the input JSON file
    $input = ProcessInputFile($JsonFilePath)

    # Get a list of SVIs to patch
    $SVIsToPatch = GetListofResourceId($input)

    # Set the default network access type if not provided
    $networkAccessType = $input.AccessType

    if (!$networkAccessType)
    {
        $networkAccessType = "Private"
    }

    if ($networkAccessType -ne "Public" -r $networkAccessType -ne "Private")
    {
        Write-Host "The networkAccessType value is not supported. Please provide from [Public, Private]"
        Exit
    }

    # Get the identity from the input
    $identity = $input.identity

    # Script block for patching SVIs in parallel
    $patchBlock = {
        param($resourceId, $networkAccessType, $userAssignedidentity, $PatchSVIwithIdentityandNetworkAccessType, $PatchSVIwithNetworkAccessType)
        if ($userAssignedidentity) {
            PatchSVIwithIdentityandNetworkAccessType $resourceId $networkAccessType $userAssignedidentity
        }
        else {
            PatchSVIwithNetworkAccessType $resourceId $networkAccessType
        }
        Start-Sleep -Seconds 5
    }

    # Loop through the items and start jobs for parallel execution
    foreach ($resourceId in $SVIsToPatch)
    {
        Start-Job -InitializationScript $PatchSVI -ScriptBlock $patchBlock -ArgumentList $resourceId, $networkAccessType, $identity
    }

    # Wait for all jobs to complete
    Get-Job | Wait-Job

    # Receive results from jobs if needed
    $results = Get-Job | Receive-Job
}

# Execute the main function
main
