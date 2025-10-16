
# Define paths
$csvPath = "C:\Path\To\URLs\sites_2_rcd.csv"
$logPath = "C:\Path\To\LogFile\rcd_log.txt"

# Import the CSV
$sites = Import-Csv -Path $csvPath

# Start logging
Add-Content -Path $logPath -Value "`n--- RCD Update Log: $(Get-Date) ---`n"

# Loop through each site
foreach ($site in $sites) {
    $url = $site.SiteUrl
    Write-Host "Processing $url..."

    try {
        Set-SPOSite -Identity $url -RestrictContentOrgWideSearch $true
        $message = "SUCCESS: RCD applied to $url at $(Get-Date)"
        Write-Host $message -ForegroundColor Green
        Add-Content -Path $logPath -Value $message
    } catch {
        $errorMessage = "ERROR: Failed to apply RCD to $url at $(Get-Date). Error: $_"
        Write-Warning $errorMessage
        Add-Content -Path $logPath -Value $errorMessage
    }
}
