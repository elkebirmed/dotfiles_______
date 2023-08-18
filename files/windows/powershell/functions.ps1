function Install-Dotfiles-Packages {
    Push-Location (Split-Path -Parent $PROFILE)
    Invoke-Expression ". ./install-packages.ps1"
    Pop-Location
}

function Sync-Dotfiles {
    Invoke-Expression ". $env:USERPROFILE/dotfiles/files/windows/powershell/sync-dotfiles.ps1"
    Write-Host "Restart your shell" -ForegroundColor Red
}

function which ($command) {
    Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

function Remove-Items-Force-Recurse ($path) {
    Remove-Item -Path $path -Recurse -Force -Confirm:$false
}
