# My configs

Bunch of config files for how I like my setup. Setup for ease of transportation.

## Git

To setup run:
- Config: `git config --global include.path <absolute-path-to-this-repo>/git/gitconfig`
- Hooks: `git config --global core.hooksPath <absolute-path-to-this-repo>/git/git-hooks`

To run single command without hooks

`git -c core.hooksPath=/dev/null ...`

## PowerShell

Run the script `powershell\setup.ps1` from root of this repo.
The script creates(if its missing) and adds `. "<absolute-path-to-this-repo>\powershell\shared-profile.ps1"` to the end of your profile.
To view and edit profile run `notepad $profile`.

## Bash

Setup by adding a source line at the end of your ~/.bashrc

```bash
# ... existing/user specific bash config
source <absolute-path-to-this-repo>/bash-config.sh
```

