using namespace System.Management.Automation
using namespace System.Management.Automation.Language

# Check PSEdition
# -----------------------------------------------------------------------------
if ($PSVersionTable["PSEdition"] -ne "Core") {
    Write-Warning "This script requires PowerShell Core."
    return
}

# Check interactive mode
# -----------------------------------------------------------------------------
function IsInteractive {
    $NonInteractive = [Environment]::GetCommandLineArgs() | Where-Object { $_ -like '-NonI*' }

    if ([Environment]::UserInteractive -and -not $NonInteractive) {
        return $true
    }

    return $false
}

if (-not (IsInteractive)) {
    return
}

# Profile for the Microsoft.Powershell Shell, only. (Not Visual Studio or other PoSh instances)
# -----------------------------------------------------------------------------
Push-Location (Split-Path -parent $profile)
"aliases", "functions", "prompt" | Where-Object { Test-Path "$_.ps1" } | ForEach-Object -process { Invoke-Expression ". .\$_.ps1" }
Pop-Location
