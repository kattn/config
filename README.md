# My configs

Bunch of config files for how I like my setup. Setup for ease of transportation.

## Git hooks

To setup run

`git config --global core.hooksPath <absolute-path-to-this-repo>/git-hooks`

To run single command without hooks

`git -c core.hooksPath=/dev/null ...`

## PowerShell

Add `. "<absolute-path-to-this-repo>\powershell\shared-profile.ps1"` to the end of your profile. 

To edit profile run `notepad $profile`
