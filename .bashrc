alias ls='ls -al'
alias ll='ls -la'
alias la='ls -la'
alias ..='cd ..'
alias ...='cd ../..'
alias gb-clean="git branch --merged | grep -vE '(^\\*|main|master)' | xargs -n 1 git branch -d"

# Folder shortcuts
alias dev='cd /c/dev'
alias repos='cd /c/dev/repos'
alias para='code /c/dev/PARA'

# Claude projects
alias claude-p='cd /c/dev/projects/claude-pg && claude'
