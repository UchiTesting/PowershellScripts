$scriptFolder = $PSScriptRoot
Write-Host "Script executed from $scriptFolder"
# Allows to think the workflow relative to script location
Set-Location -Path $scriptFolder
# Path to folder containing txt files
$textFolder = ".\TextFiles\"

# Check if folder exists
if (Test-Path -Path $textFolder) {
    "Path exists!"
    # Move to text files folder 
    Set-Location -Path $textFolder
    Write-Host "Path changed to" (Get-Location)

    $mergeFilePath = "..\MergedContent.txt"
    # Concatenate all of them 
    # Needs at least 2 files with one having content
    Get-Content .\*.txt | Sort-Object | Set-Content -Path $mergeFilePath

    # Sort all the lines (Step piped in previous line)
    
    # Bench
    Write-Host "Determining duplicates..."
    $sw = [System.Diagnostics.Stopwatch]::StartNew();

    # Determine duplicates
    Get-Content $mergeFilePath | Group-Object | Where-Object { $_.Count -ne 1 } | Format-Table -AutoSize -Property Name, Count

    $sw.Stop();

    Write-Output ("Duplication search took {0}" -f $sw.Elapsed);
}
else {
    "Path doesn't exist. Aborting"
}
