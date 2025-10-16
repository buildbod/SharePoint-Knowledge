# SharePoint RCD Automation Script

This PowerShell script automates the process of applying **Restricted Content Discovery (RCD)** settings to a list of SharePoint Online sites using the `Set-SPOSite` cmdlet.

## 📋 Features
- Reads site URLs from a CSV file
- Applies RCD (`-RestrictContentOrgWideSearch $true`) to each site
- Logs success and error messages to a log file
- Includes error handling to continue processing even if some sites fail

## 📁 CSV Format
The input CSV file should contain a column named `SiteUrl`:

```csv
SiteUrl
https://contoso.sharepoint.com/sites/site1
https://contoso.sharepoint.com/sites/site2
```

## 🛠️ Prerequisites
- SharePoint Online Management Shell installed
- Connect to your tenant using:
  ```powershell
  Connect-SPOService -Url "https://yourtenant-admin.sharepoint.com"
  ```
- Sufficient permissions to run `Set-SPOSite` on the target sites
- If you are running this against sites in a satellite geography then connect to the satellite tenant e.g.
  ```powershell
  Connect-SPOService -Url "https://yourtenantaus-admin.sharepoint.com"
  ```

## 🚀 How to Run
1. Edit the script to set the correct path to your CSV file containing site URLs ($csvPath) and the location for the log ($logPath).
2. Open SharePoint Online Management Shell
3. Run the script:
   ```powershell
   .\Apply-RCD.ps1
   ```

## 📄 Logging
- Logs are saved to a file (e.g., `rcd_log.txt`) with timestamps
- Each entry indicates success or failure for a site

## 📦 Files
- `Apply-RCD.ps1`: PowerShell script
- `sites.csv`: Input file with site URLs
- `rcd_log.txt`: Output log file


