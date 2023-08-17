# Installing modules
# -----------------------------------------------------------------------------
$moduleNames = @(
    "ClipboardText",
    "NuGet",
    "PackageManagement",
    "posh-git",
    "PowerShellGet",
    "PSFzf",
    "PSReadLine",
    "Terminal-Icons"
)

foreach ($moduleName in $moduleNames) {
    $module = Get-Module -Name $moduleName -ListAvailable

    if (!$module) {
        Write-Host "Installing $moduleName ..." -ForegroundColor Green
        Install-Module $moduleName -AllowPrerelease -Force
    }
}

# Installing packages
# -----------------------------------------------------------------------------
$packagesIds = @(
    "ajeetdsouza.zoxide",
    "BurntSushi.ripgrep.MSVC",
    "CoreyButler.NVMforWindows",
    "Discord.Discord",
    "gerardog.gsudo",
    "Git.Git",
    "GitHub.cli",
    "HeidiSQL.HeidiSQL",
    "JanDeDobbeleer.OhMyPosh",
    "junegunn.fzf",
    "M2Team.NanaZip",
    "Microsoft.VisualStudioCode",
    "MikeFarah.yq",
    "Neovim.Neovim",
    "nepnep.neofetch-win",
    "Python.Python.3.11",
    "sharkdp.bat",
    "SQLite.SQLite",
    "Yarn.Yarn"
)

foreach ($packageId in $packagesIds) {
    Write-Host "Installing $packageId ..." -ForegroundColor Green
    winget install -e --id $packageId
}

# Installing NodeJs
# -----------------------------------------------------------------------------
nvm install lts
nvm use lts
