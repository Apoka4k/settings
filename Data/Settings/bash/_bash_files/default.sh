
if [ -f /etc/bashrc ]; then
    source /etc/bashrc
fi

source $HOME/bin/git-prompt.sh
PS1='\[\e[1;32m\]\u\[\e[m\] \[\e[1;34m\]\W\[\e[m\]\[\e[1;37m\]$(__git_ps1 " (%s)")\[\e[m\] \[\e[1;32m\]\$\[\e[m\] '
export EDITOR="emacs"
export PERL5LIB="$HOME/lib/perl5:$HOME/lib/x86_64-linux-thread-multi"
export LD_LIBRARY_PATH="$HOME/lib:$HOME/lib64:$HOME/lib/perl5/x86_64-linux-thread-multi/auto/:$HOME/lib/perl5/x86_64-linux-thread-multi/Alien/SVN"
export LD_RUN_PATH="$HOME/lib:$LD_RUN_PATH"
export PKG_CONFIG_PATH="$HOME/lib/pkgconfig:$PKG_CONFIG_PATH"
export C_INCLUDE_PATH="$HOME/include:$C_INCLUDE_PATH"
export CPLUS_INCLUDE_PATH="$HOME/include:$CPLUS_INCLUDE_PATH"
export LIBRARY_PATH="$HOME/lib:$LIBRARY_PATH"
export LUA_PATH="./?.lua;$HOME/share/lua/5.1/?.lua;$HOME/share/lua/5.1/?/init.lua;$HOME/lib/lua/5.1/?.lua;$HOME/lib/lua/5.1/?/init.lua;"
export LUA_CPATH="./?.so;$HOME/lib/lua/5.1/?.so;$HOME/lib/lua/5.1/loadall.so"
export GREP_OPTIONS='--color=auto'
export WINDOW_MANAGER="$HOME/bin/awesome"
