Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Navigation aliases (bash-style)
function ll  { Get-ChildItem -Force $args }
function la  { Get-ChildItem -Force $args }
Set-Alias -Name .. -Value _dotdot -Option AllScope
function _dotdot  { Set-Location .. }
Set-Alias -Name ... -Value _dotdotdot -Option AllScope
function _dotdotdot { Set-Location ../.. }

# Folder shortcuts
function dev    { Set-Location "C:\dev" }
function repos  { Set-Location "C:\dev\repos" }
function para   { code "C:\dev\PARA" }

# Claude projects
function claude-p {
    Set-Location "C:\dev\projects\claude-pg"
    claude
}

# Git

# removes merged branches except main, current and master.
function gb-clean {
    git branch --merged |
    ForEach-Object { $_.trim() } |
    Where-Object { $_ -notmatch "^\*" } |
    Where-Object { $_ -notmatch 'main' -and $_ -notmatch 'master'} |
    ForEach-Object { git branch -d $_ }
}

# Python

# venv: activate the python virtual environment located at .venv in the current directory
# Usage: `venv` (activates ./.venv)
function venv {
    [CmdletBinding()]
    param()

    $current = Get-Location
    $venvDir = Join-Path $current.Path '.venv'

    if (-not (Test-Path $venvDir -PathType Container)) {
        Write-Host "No .venv folder found in the current directory." -ForegroundColor Yellow
        Write-Host "Create one with: python -m venv .venv" -ForegroundColor DarkGray
        return 1
    }

    # PowerShell activation script path (Windows venv layout)
    $activate = Join-Path $venvDir 'Scripts\Activate.ps1'
    if (-not (Test-Path $activate)) {
        Write-Host "Activation script not found at '$activate'." -ForegroundColor Red
        return 1
    }

    Write-Host "Activating venv at '$venvDir'..." -ForegroundColor Green
    # Dot-source the activation script so it modifies the current session
    . "$activate"
}
