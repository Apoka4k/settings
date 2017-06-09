
# ------------------------------------------------------------------------ #
# RESOURCES BOUNDS                                                         #
# ------------------------------------------------------------------------ #

# -- RAM bound (MB) --
# ulimit -m 2000

# -- stack bound (MB or unlimited) --
# ulimit -s unlimited

# ------------------------------------------------------------------------ #
# PROCESSES SETTINGS                                                       #
# ------------------------------------------------------------------------ #

# -- don't create .pyc .pyo files --
export PYTHONDONTWRITEBYTECODE="_"

# ------------------------------------------------------------------------ #
# PYTHON PATHS                                                             #
# ------------------------------------------------------------------------ #

# -- script --
export PYTHONPATH="/home/apoka/script/python:$PATH"

# ------------------------------------------------------------------------ #
# ALIASES                                                                  #
# ------------------------------------------------------------------------ #

alias chrome="google-chrome"

# ------------------------------------------------------------------------ #
# COMMANDS                                                                 #
# ------------------------------------------------------------------------ #

# -- process execution with resources bound --
# -- usage: run <process>
alias run="/home/sbicego/usr/bin/runlim -s 3000 -r 3600"

# -- guess right tool to open file --
# -- usage: open <file>
alias open="gnome-open"

# -- show resources used by process --
# -- usage: time <process>
alias time="/usr/bin/time --format=\"\n-------------------\n%E s %M KB\n-------------------\n\""

# -- show file lines number --
# -- usage: lines <file>
alias lines="/usr/bin/wc -l <"

# -- open emacs inside bash --
# -- usage: edit [<file>]
alias edit="/usr/bin/emacs -nw"

# ------------------------------------------------------------------------ #
# DIRS                                                                     #
# ------------------------------------------------------------------------ #

# -- python scripts --
alias script-dir="cd /home/apoka/script/python"

# -- shared dir --
alias shared-dir="cd /home/apoka/shared"

# -- manual --
alias manual-dir="cd /home/apoka/rep/settings/manual"

# ------------------------------------------------------------------------ #
