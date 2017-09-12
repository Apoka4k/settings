
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

# -- set mouse sensitivity --
mouse_ids=`xinput -list | grep Mouse | sed -n "s/.*id=\([0-9]*\).*/\1/p"`
for mouse_id in $mouse_ids; do
    xinput --set-prop $mouse_id "Device Accel Constant Deceleration" 1.5
done

# -- don't create .pyc .pyo files --
export PYTHONDONTWRITEBYTECODE="_"

# ------------------------------------------------------------------------ #
# PYTHON PATHS                                                             #
# ------------------------------------------------------------------------ #

# -- script --
export PYTHONPATH="/home/apoka/script/python:$PATH"

# -- ply --
export PYTHONPATH="/home/apoka/exe/ply:$PATH"

# -- pycparser --
export PYTHONPATH="/home/apoka/exe/pycparser:$PATH"

# ------------------------------------------------------------------------ #
# ALIASES                                                                  #
# ------------------------------------------------------------------------ #

alias chrome="google-chrome"

# ------------------------------------------------------------------------ #
# COMMANDS                                                                 #
# ------------------------------------------------------------------------ #

# -- process execution with resources bound --
# -- usage: run <process>
alias run="/usr/bin/runlim -s 3000 -r 3600"

# -- guess right tool to open file --
# -- usage: open <file>
alias open="/usr/bin/gnome-open &> /dev/null"

# -- show resources used by process --
# -- usage: time <process>
alias time="/usr/bin/time --format=\"\n-------------------\n%E s %M KB\n-------------------\n\""

# -- show file lines number --
# -- usage: lines <file>
alias lines="/usr/bin/wc -l <"

# -- show object size --
# -- usage: dim <path>
alias dim="/usr/bin/du -sh"

# -- open emacs inside bash --
# -- usage: edit [<file>]
alias emacs-edit="/usr/bin/emacs -nw"

# -- show absolute real path --
# -- usage: path <path>
alias path="/usr/bin/realpath"

# -- extract compressed dia file --
# -- usage: extract_dia <file>
alias extract_dia="/bin/gunzip -S .dia"

# ------------------------------------------------------------------------ #
# OPTIONS                                                                  #
# ------------------------------------------------------------------------ #

# -- open file with gimp --
# -- usage: gimp <file>
alias gimp="/usr/bin/gimp &> /dev/null"

# -- open dia --
# -- usage: dia
alias dia="/usr/bin/dia &> /dev/null &"

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
