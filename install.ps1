# Clone the repo
# -----------------------------------------------------------------------------
$repoPath = "$env:USERPROFILE/dotfiles"

if (-not (Test-Path $repoPath)) {
    Write-Host "Cloning repository" -ForegroundColor Cyan
    git clone https://github.com/elkebirmed/dotfiles.git $repoPath
}
else {
    Write-Warning "Repository already exists at $repoPath."
}

# Install
# -----------------------------------------------------------------------------
Invoke-Expression "$repoPath/files/windows/powershell/sync-dotfiles.ps1"
Invoke-Expression "$repoPath/files/windows/powershell/install-packages.ps1"

Write-Host "Restart your shell" -ForegroundColor Red
