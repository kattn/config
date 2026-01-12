$ErrorActionPreference = 'Stop'

$sharedProfilePath = (Resolve-Path -LiteralPath .\powershell\shared-profile.ps1)

if (-not (Test-Path -Path $sharedProfilePath)) {
    throw "Shared profile not found at $sharedProfilePath"
}

if (-not (Test-Path -Path $profile)) {
    New-Item -ItemType File -Path $profile -Force | Out-Null
}

$sourceLine = '. "{0}"' -f $sharedProfilePath
$profileContent = Get-Content -Path $profile -Raw -ErrorAction SilentlyContinue

if ([string]::IsNullOrWhiteSpace($profileContent) -or $profileContent -notmatch [regex]::Escape($sourceLine)) {
    Add-Content -Path $profile -Value $sourceLine
    Write-Host "Added sourcing line to $profile"
} else {
    Write-Host "Sourcing line already present in $profile"
}
