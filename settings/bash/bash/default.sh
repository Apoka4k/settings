
# ------------------------------------------------------------------------ #
# IDENTIFIERS                                                              #
# ------------------------------------------------------------------------ #

# -- root settings --
source /etc/bashrc

# -- git interface --
source /home/sbicego/usr/etc/git/git-prompt.sh

# -- prompt indenting message --
export PS1="\[\e[1;34m\]\W\[\e[1;32m\] \\$ \[$(tput sgr0)\]"

# -- git-compatible prompt indenting message (overwrites PS1) --
export PROMPT_COMMAND='__git_ps1 "\[\e[1;34m\]\W\[\e[1;97m\]" " \[\e[1;32m\]\\\$ \[$(tput sgr0)\]"'

# -- home --
export HOME="/home/sbicego"

# -- bin --
export PATH="/home/sbicego/usr/bin:$PATH"

# -- lib --
export LIBRARY_PATH="/home/sbicego/usr/lib"
export LD_LIBRARY_PATH="/home/sbicego/usr/lib"
export LD_RUN_PATH="/home/sbicego/usr/lib"

# -- pkg --
export PKG_CONFIG_PATH="/home/sbicego/usr/lib/pkgconfig:$PKG_CONFIG_PATH"

# -- options --
export GREP_OPTIONS='--color=auto'
export EDITOR="/usr/bin/emacs"

# -- colors --
export BLACK="\e[30m"
export BLUE="\e[34m"
export CYAN="\e[36m"
export GREEN="\e[32m"
export MAGENTA="\e[35m"
export RED="\e[31m"
export WHITE="\e[97m"
export YELLOW="\e[33m"
# --
export BBLACK="\e[1;30m"
export BBLUE="\e[1;34m"
export BCYAN="\e[1;36m"
export BGREEN="\e[1;32m"
export BMAGENTA="\e[1;35m"
export BRED="\e[1;31m"
export BWHITE="\e[1;97m"
export BYELLOW="\e[1;33m"
# --
export DEFAULT="\e[39m"

# ------------------------------------------------------------------------ #
