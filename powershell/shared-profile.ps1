Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

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
