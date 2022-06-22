Clear-Host
Write-Host "Starting setup script at $(Get-Date)"
$ErrorActionPreference = 'Stop'

#Installing required packages

[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
Register-PSRepository -Default -Verbose -ErrorAction 'SilentlyContinue'
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted -ErrorAction 'SilentlyContinue'
Install-Module -Name Az.Sql -Force -Verbose:$false -WarningAction 'SilentlyContinue'
Install-Module -Name Az.Storage -Force -Verbose:$false -WarningAction 'SilentlyContinue'
Install-Module -Name Az.Resources -Force -Verbose:$false -WarningAction 'SilentlyContinue'

#Creating required variables

$AzureUsername = Read-Host -Prompt "Enter your Azure account name"
$AzurePassword = Read-Host -Prompt "Enter your Azure account password" -AsSecureString 
$ResourceGroupName = Read-Host -Prompt "Enter your resource group name" 

$AzCredential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList ($AzureUsername, $AzurePassword)
Connect-AzAccount -Credential $AzCredential

$Location = Get-AzResourceGroup -Name $ResourceGroupName | Select-Object -ExpandProperty location
$storageName = ('dp500sa' + (Get-Random -Minimum 0 -Maximum 999999 ).ToString('000000')).ToLower()
$ServerName = ('dp500server-' + (Get-Random -Minimum 0 -Maximum 999999 ).ToString('000000')).ToLower()
$FolderName = "C:\DP500"

#Cloning GitHub repository
#TODO: Shannon, we may need to remove this entire try/catch section. Please make sure to update the $FolderName variable to where the repo is pointing to in the lab VM

try
{
    If (Test-Path $FolderName)
    {
        Remove-Item $FolderName -Recurse -Force -Confirm:$false
    }
    else
    {
        New-Item -Path $FolderName -ItemType Directory
    }
    git clone "https://github.com/MicrosoftLearning/DP-500T00A-Designing-and-Implementing-Enterprise-Scale-Analytics-Solutions-Using-Microsoft-Azure.git" $FolderName -q
    start-sleep -s 5
}
catch
{
    $ErrorMessage = $_.Exception.Message
    Write-Output $ErrorMessage
}

#Create storage account

$StorageHT = @{  
     ResourceGroupName = $ResourceGroupName
     Name              = $storageName 
     SkuName           = 'Standard_LRS'  
     Location          = $location
}
$StorageAccount = New-AzStorageAccount @StorageHT

Start-Sleep -s 120

#Upload .bacpac file to storage account

$SA = Get-AzStorageAccount -ResourceGroupName $ResourceGroupName  -Name $storageName
$Context = $SA.Context
$ContainerName = 'dp500'
New-AzStorageContainer -Name $ContainerName -Context $Context -Permission Blob  

Start-Sleep -s 5

$Blob1HT = @{  
    File             = "$($FolderName)\Allfiles\DatabaseBackup\AdventureWorksDW2022-DP500.bacpac"          
    Container        = $ContainerName  
    Blob             = "AdventureWorksDW2022-DP500.bacpac"  
    Context          = $Context  
    StandardBlobTier = 'Hot'
}

Set-AzStorageBlobContent @Blob1HT 

#Create SQL Database server

$SQLPassword = ConvertTo-SecureString -String 'P@ssw0rd01' -AsPlainText -Force
$SQLCredential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList 'sqladmin',$SQLPassword 

New-AzSqlServer -ServerName $ServerName -ResourceGroupName $ResourceGroupName -Location $Location -SqlAdministratorCredentials $SQLCredential
Start-Sleep -s 5

New-AzSqlServerFirewallRule -ResourceGroupName $ResourceGroupName -ServerName $ServerName -AllowAllAzureIPs
Start-Sleep -s 5

#Import .bacpac file

New-AzSqlDatabaseImport -ResourceGroupName $ResourceGroupName -ServerName $ServerName -DatabaseName "AdventureWorksDW2022-DP500" -DatabaseMaxSizeBytes 5368709120  -StorageKeyType "StorageAccessKey" -StorageKey $(Get-AzStorageAccountKey -ResourceGroupName $ResourceGroupName -StorageAccountName $storageName).Value[0] -StorageUri "https://$($storageName).blob.core.windows.net/dp500/AdventureWorksDW2022-DP500.bacpac" -Edition "Standard" -ServiceObjectiveName "S2" -AdministratorLogin "sqladmin" -AdministratorLoginPassword $(ConvertTo-SecureString -String 'P@ssw0rd01' -AsPlainText -Force)

Start-Sleep -s 300

Write-Host "Finishing setup script at $(Get-Date)"
