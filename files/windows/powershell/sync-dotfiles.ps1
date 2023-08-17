function Get-ScriptDirectory {
    Split-Path -Parent $PSCommandPath
}

# Sync Windows Terminal settings
# ------------------------------------------------------------------------------
Set-Variable -Name "WT_SRC_FILE" -Value ("$(Get-ScriptDirectory)\..\settings\windows_terminal.json" | Convert-Path)
Set-Variable -Name "WT_DEST_FILE" -Value "$env:USERPROFILE\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
Set-Variable -Name "WTP_DEST_FILE" -Value "$env:USERPROFILE\AppData\Local\Packages\Microsoft.WindowsTerminalPreview_8wekyb3d8bbwe\LocalState\settings.json"

if (Test-Path -Path $WT_DEST_FILE) {
    Write-Host "Syncing Windows Terminal settings" -ForegroundColor Cyan
    Copy-Item -Path $WT_SRC_FILE -Destination $WT_DEST_FILE -Force
}

if (Test-Path -Path $WTP_DEST_FILE) {
    Write-Host "Syncing Windows Terminal Preview settings" -ForegroundColor Cyan
    Copy-Item -Path $WT_SRC_FILE -Destination $WTP_DEST_FILE -Force
}

# Sync PowerShell settings
# ------------------------------------------------------------------------------
Set-Variable -Name "PS_SRC_FILES" -Value ("$(Get-ScriptDirectory)\*" | Convert-Path)
Set-Variable -Name "PS_DEST_DIR" -Value "$env:USERPROFILE\Documents\PowerShell"

if (Test-Path -Path $PS_SRC_FILES) {
    Write-Host "Syncing PowerShell settings" -ForegroundColor Cyan
    Copy-Item -Path $PS_SRC_FILES -Destination $PS_DEST_DIR -Force -PassThru -Recurse
}
