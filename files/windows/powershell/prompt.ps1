# Modules
# -----------------------------------------------------------------------------
Import-Module -Name Terminal-Icons
Import-Module -Name PSReadLine

# PSReadLine
# -----------------------------------------------------------------------------
Set-PSReadLineOption -EditMode Emacs `
    -BellStyle None `
    -HistoryNoDuplicates `
    -PredictionSource History `
    -PredictionViewStyle ListView `
    -ShowToolTips `
    -HistorySearchCursorMovesToEnd

Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadLineKeyHandler -Key Ctrl+n -Function HistorySearchForward
Set-PSReadLineKeyHandler -Key Ctrl+p -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key Ctrl+q -Function TabCompleteNext
Set-PSReadLineKeyHandler -Key Ctrl+Q -Function TabCompletePrevious
Set-PSReadLineKeyHandler -Key Ctrl+C -Function Copy
Set-PSReadLineKeyHandler -Key Ctrl+v -Function Paste
Set-PSReadLineKeyHandler -key Ctrl+d -Function DeleteChar
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

# PSFzf
# -----------------------------------------------------------------------------
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' `
    -PSReadlineChordReverseHistory 'Ctrl+r'

# OhMyPosh
# -----------------------------------------------------------------------------
Import-Module posh-git
$themePath = Join-Path (Split-Path -Parent $PROFILE) "theme.omp.json"
oh-my-posh init pwsh -c $themePath | Invoke-Expression

# Zoxide
# -----------------------------------------------------------------------------
Invoke-Expression (& { (zoxide init powershell | Out-String) })
