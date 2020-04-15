# Aliases ---------------------------------------------------------------------
alias ls="ls -G"
alias ll="exa -lFg --git --color-scale"
alias la="exa -laaFg --git --color-scale"
alias nano="/usr/local/bin/nano -c"
alias diff="colordiff"
alias clip="pbcopy"
alias paste="pbpaste"
alias tar="export COPYFILE_DISABLE=true; tar"
alias wireshark="nohup sudo Wireshark &> /dev/null &"
alias gs="git-status"
alias gvnm="grep -v node_modules"
alias bl="./node_modules/.bin/bunyan"
alias myopenssl="/usr/local/opt/openssl@1.1/bin/openssl"
alias wf="watch -n 1 -d "
alias k="kubectl"
alias e="eksctl"
alias r="rancher"
alias rk="rancher kubectl"
alias tf="terraform"

# History ---------------------------------------------------------------------
export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=4096

# Allow ctl+s forward history search ------------------------------------------
stty -ixoff
stty stop undef
stty start undef

# Grep ------------------------------------------------------------------------
export GREP_OPTIONS='--color=always'
export GREP_COLOR='1;35;40'

# Kubernetes ------------------------------------------------------------------
source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
source "/usr/local/opt/kubectx/etc/bash_completion.d/kubectx"
source "/usr/local/opt/kubectx/etc/bash_completion.d/kubens"

# Git -------------------------------------------------------------------------
function parse_git_untracked {
  git status 2> /dev/null | grep "Untracked files:" &> /dev/null && printf "\033[1;31m~\033[0m"
}
function parse_git_dirty {
  git status 2> /dev/null | grep "Changes not staged for commit:" &> /dev/null  && printf "\033[1;31m*\033[0m"
}
function parse_git_added {
  git status 2> /dev/null | grep "Changes to be committed:" &> /dev/null && printf "\033[1;32m+\033[0m"
}
function parse_git_stash {
  [[ $(git stash list 2> /dev/null | tail -n1) != "" ]] && printf "\033[1;33m^\033[0m"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/(\1$(parse_git_untracked)$(parse_git_dirty)$(parse_git_added)$(parse_git_stash))/"
}

source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/git-completion.bash

# Prompt ----------------------------------------------------------------------
export PS1='\n$(kube_ps1)\033[01;36m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w \[\033[00m\]$(parse_git_branch)\n> '

# SSH -------------------------------------------------------------------------
#eval `ssh-agent`

# Node -------------------------------------------------------------------------
export PATH="$PATH:./node_modules/.bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Bash Completion -------------------------------------------------------------
#if [ -f $(brew --prefix)/etc/bash_completion ]; then
#    . $(brew --prefix)/etc/bash_completion
#fi

# ITERM2-----------------------------------------------------------------------
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# Golang ----------------------------------------------------------------------
export GO111MODULE="auto"
export GOPATH="${HOME}/go"
export GOBIN="${GOPATH}/bin"
export PATH="${PATH}:${GOBIN}"

# Path ------------------------------------------------------------------------
export PATH="${PATH}:${HOME}/git/github.com/mrdefenestrator/environment/scripts"

# Misc ------------------------------------------------------------------------
source "${HOME}/.profile-charter"
