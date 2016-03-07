alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias sl="ls"
alias sortip="sort -n -t . -k 1,1 -k 2,2 -k 3,3 -k 4,4"
alias sed="sed -E"
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'
alias urldecode='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])"'
alias objdump="objdump -M intel intel-mnemonic "
alias pws="python -m SimpleHTTPServer "
alias eip="dig +short myip.opendns.com @resolver1.opendns.com"
alias gdb="gdb -q"
alias mkdir="mkdir -p"
alias cpus="if [ $(uname) == 'Darwin' ]; then sysctl -n hw.ncpu; else grep -c processor /proc/cpuinfo; fi"
#alias ram="if [ $(uname) == 'Darwin' ]; then export mem=$(echo $(sysctl -n hw.memsize)/1024/1024/1000| bc); echo ${mem}GB; else echo $(free -m | grep Mem | awk '{print $2;}')MB; fi"
