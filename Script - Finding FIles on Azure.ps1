# Variables
$storageAccountName = "Storageaccount" # storage account name
$containerName = "01raw" # storage account container / filesystem name
$folderPath = "/" # folder path to directory to calculate size for
$fileRegex = ".*emp_table_2012-06-10" # file regex to search for

# Program
$context = New-AzStorageContext -StorageAccountName $storageAccountName
$Files = Get-AzDataLakeGen2ChildItem -Context $context -FileSystem $containerName -Path $folderPath -Re#curse | Where-Object IsDirectory -eq $false
$Total = $Files | Where-Object { $_.Path -match $fileRegex}

$Total | ForEach-Object { $_.Path }
