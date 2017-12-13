
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
# BASH PATHS                                                               #
# ------------------------------------------------------------------------ #

# ------------------------------------------------------------------------ #
# PYTHON PATHS                                                             #
# ------------------------------------------------------------------------ #

# -- script --
export PYTHONPATH="/home/apoka/.script/python:$PYTHONPATH"

# -- pysmt --
# export PYTHONPATH="/home/apoka/.smt_solvers/python-bindings-2.7:$PYTHONPATH"

# -- pyprof2calltree --
export PYTHONPATH="/home/apoka/rep/pyprof2calltree:$PYTHONPATH"

# ------------------------------------------------------------------------ #
# ALIASES                                                                  #
# ------------------------------------------------------------------------ #

# chrome
alias chrome="google-chrome"

# -- pyprof2calltree --
alias pyprof2calltree="/home/apoka/rep/pyprof2calltree/pyprof2calltree.py -k -i"

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
alias extract-dia="/bin/gunzip -S .dia"

# -- open pdf file with evince --
# -- usage: pdfreader <file>
alias pdfreader="/usr/bin/evince"

# -- cmake for estools/builders/xsap --
# -- usage: cmake ..
alias cmake-xsap="cmake .. -DENABLE_LIBXML=ON -DBUILD_STATIC=ON -DPREFER_STATIC_LIBRARIES=ON"
# alias cmake-xsap="cmake .. -DENABLE_LIBXML=ON -DBUILD_STATIC=OFF -DPREFER_STATIC_LIBRARIES=OFF"

# -- extract compressed files --
# -- usage: extract_<extension> <file>
alias extract-tar-gz="tar -zxf"
alias extract-tar-xz="tar -xf"
alias extract-bz-2="tar -xjf"
alias extract-zip="unzip"

# -- runsnake without stderr --
# -- usage: runsnake <file>
alias runsnake="/usr/bin/runsnake 2> /dev/null"

# -- real path of current directory --
# -- usage: pwd
alias pwd="/bin/pwd -P"

# -- copy symbolic links --
# -- usage: cp <file> <file>
alias cp="/bin/cp -d"

# -- python with profile --
# -- usage: python-profile <file> <args>
alias python-profile="/usr/bin/python -m cProfile"

# -- python with trace --
# -- usage: python-trace <file> <args>
alias python-trace="/usr/bin/python -m trace -t -g"

# -- git user info configuration --
# -- usage: git-set-name <name>
# --        git-set-email <email>
alias git-set-name="git config user.name"
alias git-set-email="git config user.email"

# -- remote access shortcuts --
# -- usage: ssh-<machine>
alias ssh-korein="ssh sbicego%korein@gate.fbk.eu"
alias ssh-mitchell="ssh sbicego%mitchell@gate.fbk.eu"

# ------------------------------------------------------------------------ #
# FUNCTIONAL ALIASES                                                       #
# ------------------------------------------------------------------------ #

# -- get pdf from pdf --
# -- usage: pdftk <in-file> <pages> <out-file>
function pdf-split
{
    /usr/bin/pdftk $1 cat $2 output $3
}

# -- emacs --
emacs() { command emacs $@ & }

# -- gimp --
function gimp
{
    command gimp $@ &> /dev/null &
}

# -- dia --
function dia
{
    command dia $@ &
}

# ------------------------------------------------------------------------ #
# DIRS                                                                     #
# ------------------------------------------------------------------------ #

# -- python scripts --
alias script-dir="cd /home/apoka/.script/python"

# -- shared dir --
# alias shared-dir="cd /home/apoka/shared"

# -- manual --
alias manual-dir="cd /home/apoka/rep/settings/manual"

# ------------------------------------------------------------------------ #
