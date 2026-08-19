$ScriptPath = Join-Path $PSScriptRoot 'RegisterSIDs.ps1'
$Tokens = $null
$ParseErrors = $null
$ScriptAst = [System.Management.Automation.Language.Parser]::ParseFile(
    $ScriptPath,
    [ref]$Tokens,
    [ref]$ParseErrors)

function Import-FunctionFromScriptAst
{
    param(
        [Parameter(Mandatory = $true)]
        [String]$Name
    )

    $FunctionAst = $ScriptAst.Find(
        {
            param($Node)
            $Node -is [System.Management.Automation.Language.FunctionDefinitionAst] -and
                $Node.Name -eq $Name
        },
        $true)

    if ($null -eq $FunctionAst)
    {
        throw "Function '$Name' was not found in '$ScriptPath'."
    }

    Set-Item -Path "Function:\script:$Name" -Value $FunctionAst.Body.GetScriptBlock()
}

function Get-RegistrationScriptBlock
{
    $VariableAst = @($ScriptAst.FindAll(
        {
            param($Node)
            $Node -is [System.Management.Automation.Language.VariableExpressionAst] -and
                $Node.VariablePath.UserPath -eq 'ScriptBlockCopy'
        },
        $true))[0]

    if ($null -eq $VariableAst)
    {
        throw "Registration script block was not found in '$ScriptPath'."
    }

    return $VariableAst.Parent.Right.Expression.ScriptBlock.GetScriptBlock()
}

Import-FunctionFromScriptAst -Name 'ConvertTo-TagHashtable'
Import-FunctionFromScriptAst -Name 'ConvertTo-ManagedResourcesNetworkAccessType'

Describe 'RegisterSIDs security regression tests' {
    It 'has valid PowerShell syntax' {
        $ParseErrors.Count | Should Be 0
    }

    It 'parses the documented tag format into a hashtable' {
        $Tags = ConvertTo-TagHashtable -Tag 'key1 = "value1"; key2 = ''value2'''

        $Tags.Count | Should Be 2
        $Tags['key1'] | Should Be 'value1'
        $Tags['key2'] | Should Be 'value2'
    }

    It 'returns an empty hashtable when tags are not provided' {
        $Tags = ConvertTo-TagHashtable -Tag ' '

        $Tags.Count | Should Be 0
    }

    It 'keeps PowerShell syntax in tag values as literal data' {
        $MarkerPath = Join-Path $TestDrive 'command-executed.txt'
        $Payload = '$(Set-Content -Path "{0}" -Value "executed") | & whoami' -f $MarkerPath

        $Tags = ConvertTo-TagHashtable -Tag ('payload = "{0}"' -f $Payload)

        $Tags['payload'] | Should Be $Payload
        (Test-Path $MarkerPath) | Should Be $false
    }

    It 'rejects duplicate tag names' {
        $Thrown = $false
        try
        {
            ConvertTo-TagHashtable -Tag 'key = "one"; key = "two"'
        }
        catch
        {
            $Thrown = $true
        }

        $Thrown | Should Be $true
    }

    It 'rejects malformed tag entries and mismatched quotes' {
        foreach ($InvalidTag in @('missingEquals', 'key = "unterminated'))
        {
            $Thrown = $false
            try
            {
                ConvertTo-TagHashtable -Tag $InvalidTag
            }
            catch
            {
                $Thrown = $true
            }

            $Thrown | Should Be $true
        }
    }

    It 'accepts only exact supported network access values' {
        (ConvertTo-ManagedResourcesNetworkAccessType -NetworkAccessType ' Private ') |
            Should Be 'Private'
        (ConvertTo-ManagedResourcesNetworkAccessType -NetworkAccessType 'Public') |
            Should Be 'Public'
        (ConvertTo-ManagedResourcesNetworkAccessType -NetworkAccessType '') |
            Should Be $null
    }

    It 'rejects network access values containing executable suffixes' {
        foreach ($InvalidNetworkAccessType in @('Private; whoami', 'Public$(whoami)'))
        {
            $Thrown = $false
            try
            {
                ConvertTo-ManagedResourcesNetworkAccessType `
                    -NetworkAccessType $InvalidNetworkAccessType
            }
            catch
            {
                $Thrown = $true
            }

            $Thrown | Should Be $true
        }
    }

    It 'contains no dynamic command execution' {
        $DynamicCommands = @($ScriptAst.FindAll(
            {
                param($Node)
                $Node -is [System.Management.Automation.Language.CommandAst] -and
                    $Node.GetCommandName() -eq 'Invoke-Expression'
            },
            $true))

        $DynamicCommands.Count | Should Be 0
    }

    It 'passes optional values as data through parameter splatting' {
        $RegistrationScriptBlock = Get-RegistrationScriptBlock
        $Tags = @{
            payload = '$(Set-Content command-executed.txt "executed") | & whoami'
        }
        $script:CapturedParameters = $null

        function New-AzWorkloadsSapVirtualInstance
        {
            param(
                $ResourceGroupName,
                $Name,
                $Location,
                $Environment,
                $SapProduct,
                $CentralServerVmId,
                $IdentityType,
                $UserAssignedIdentity,
                $Tag,
                $ManagedResourceGroupName,
                $ManagedRgStorageAccountName,
                $ManagedResourcesNetworkAccessType
            )

            $script:CapturedParameters = $PSBoundParameters
        }

        & $RegistrationScriptBlock 'resource-group' 'SID' 'eastus' 'NonProd' 'S4HANA' `
            '/subscriptions/test/resourceGroups/resource-group/providers/Microsoft.Compute/virtualMachines/vm' `
            'managed-rg' '/subscriptions/test/resourceGroups/identity/providers/Microsoft.ManagedIdentity/userAssignedIdentities/id' `
            $Tags 'storageaccount' 'Private'

        $script:CapturedParameters['Tag']['payload'] | Should Be $Tags['payload']
        $script:CapturedParameters['ManagedResourceGroupName'] | Should Be 'managed-rg'
        $script:CapturedParameters['ManagedRgStorageAccountName'] | Should Be 'storageaccount'
        $script:CapturedParameters['ManagedResourcesNetworkAccessType'] | Should Be 'Private'
    }
}
