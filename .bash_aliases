# OS Specific aliases
if [ $(uname) == 'Darwin' ]; then
    alias ls='ls -G'
    alias cpus="sysctl -n hw.ncpu"
    alias ram="export mem=$(echo $(sysctl -n hw.memsize)/1024/1024/1000| bc); echo ${mem}GB"
else # Assumes Linux
    alias ls='ls --color=auto'
    alias cpus="grep -c processor /proc/cpuinfo"
    alias ram="echo $(free -m | grep Mem | awk '{print $2;}')MB"
fi

# General
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias sl="ls"
alias sortip="sort -n -t . -k 1,1 -k 2,2 -k 3,3 -k 4,4"
alias sed="sed -E"
alias mkdir="mkdir -p"
alias ..="cd .."
alias du="du -sh"
alias df="df -h"

function cdls() {
  builtin cd "$*"
  RESULT=$?
  if [ "$RESULT" -eq 0 ]; then
    ls
  fi
}

alias cdl=cdls

# git
alias gs="git status "
alias gc="git commit "
alias gp="git push origin master"
alias gl="git log"
alias gd="git diff"

# Network
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'
alias urldecode='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])"'
alias eip="dig +short myip.opendns.com @resolver1.opendns.com"
alias pws="ifconfig|grep 'inet addr'|cut -d':' -f2|cut -d' ' -f1; python -m SimpleHTTPServer"
alias ipwhois="python -c \"from ipwhois import IPWhois; import sys; print IPWhois(sys.argv[1]).lookup_whois()['nets'][0]['description'].replace(',',' ')\""

# Debugging
alias objdump="objdump -M intel intel-mnemonic "
alias gdb="gdb -q"
