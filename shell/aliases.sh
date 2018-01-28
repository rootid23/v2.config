alias g="git"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"

### Aliases
alias lr='ls -ltr'
alias tx='tmux'
alias takeover="tmux detach -a"

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


if [[ $OSTYPE == darwin* ]]
then
  # power
  alias shutdown='sudo shutdown -hP now'
  alias reboot='sudo reboot now'
  alias sleep='shutdown -s now'
  alias meld='/Applications/Meld.app/Contents/MacOS/Meld'
  # misc
  alias unlock_files='chflags -R nouchg *'

  # IP addresses
  alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
  alias localip="ipconfig getifaddr en0"
  alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
  # Show active network interfaces
  alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"

  # Flush Directory Service cache
  alias flush="killall -HUP mDNSResponder"
elif [[ $OSTYPE == linux-gnu ]]
then
   # power
   alias shutdown='sudo shutdown -P now'
   alias reboot='sudo shutdown -r now'
   alias halt='sudo halt -P'
fi



# vim: ai ts=2 sw=2 et sts=2 ft=sh
