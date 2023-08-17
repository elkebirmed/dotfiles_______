function Install-Dotfiles-Packages {
    Push-Location (Split-Path -Parent $PROFILE)
    Invoke-Expression ". ./install-packages.ps1"
    Pop-Location
}

function Sync-Dotfiles {
    Push-Location (Split-Path -Parent $PROFILE)
    Invoke-Expression ". ./sync-dotfiles.ps1"
    Pop-Location

    & $PROFILE
}

function which ($command) {
    Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}
