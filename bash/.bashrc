## Prereq
#mkdir -p $HOME/.local/share/shell


#HISTCONTROL=ignoreboth
# Unset for unlimited history
HISTSIZE=
HISTFILESIZE=

shell_data="$HOME/.local/share/shell"

# Use separate history file to avoid truncation
HISTFILE="$shell_data/bash_history"

### Terminal
PS1="\u@mat \W\$ "

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

source ~/aliases.sh
source ~/git-completion.bash

CUSTOM_BIN=$HOME/v2.config/bin
export PATH=$CUSTOM_BIN:$PATH

source /usr/local/etc/bash_completion.d/password-store


GIT_HUB_WRAPPER_LIB=$HOME/new-wave/git-hub/lib
GIT_HUB_WRAPPER_MAN=$HOME/new-wave/git-hub/man
export PATH="$GIT_HUB_WRAPPER_LIB:$PATH"
export MANPATH="$GIT_HUB_WRAPPER_MAN:$MANPATH"

# vim: ai ts=2 sw=2 et sts=2 ft=sh
