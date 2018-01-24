
HISTSIZE=1000
HISTFILESIZE=2000

### Terminal
PS1="\u@mat \W\$ "

### Aliases
alias lr='ls -ltr'
alias tx='tmux'

### ACK aliases
alias aj='ack --java'
alias ash='ack --shell'
alias aji='ack --java implements'
alias ajs='ack --json'
alias ajs1='ack --js'
alias ag='ack --groovy'
alias ax='ack --xml'
alias ah='ack --html'
alias ad='ack --dust'
alias ay='ack --python'
alias ac='ack --cpp'
alias as='ack --scala'
alias av='ack --vim'
alias vgrep='ack'


### Git aliases
alias gp='git pull'
alias ga='git add'
alias gs='git status'
alias gco='git checkout'
alias gb='git branch -a'
alias gm='git commit -m'
alias gcls='git clean -xf'
alias gf='git diff --name-only'
alias gdiff='git difftool origin/master'
alias gdiffh='git difftool HEAD'
alias glg='git log --pretty=format:"%h | <%ce>|<%cn> | %ci"'
alias gpm='git push -u origin master'
alias gut='git ls-files --others --exclude-standard'
alias gl1="git status --porcelain | awk '{print $2}'"


eval "$(direnv hook bash)"
eval "$(pipenv --completion)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add tab completion for many Bash commands
if which brew &> /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
	source "$(brew --prefix)/share/bash-completion/bash_completion";
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion;
fi;

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
	complete -o default -o nospace -F _git g;
fi;
