
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

# xSAP test script path
# export XSAP_SCRIPT_DIR="/home/apoka/rep/estools/xSAP/scripts"

# ------------------------------------------------------------------------ #
# PYTHON PATHS                                                             #
# ------------------------------------------------------------------------ #

# -- script --
export PYTHONPATH="/home/apoka/.script/python:$PYTHONPATH"

# -- pysmt --
export PYTHONPATH="/home/apoka/.smt_solvers/python-bindings-2.7:$PYTHONPATH"

# -- pyprof2calltree --
export PYTHONPATH="/home/apoka/rep/pyprof2calltree:$PYTHONPATH"

# ------------------------------------------------------------------------ #
# ALIASES                                                                  #
# ------------------------------------------------------------------------ #

# chrome
alias chrome="google-chrome"

# -- pyprof2calltree --
alias pyprof2calltree="/home/apoka/rep/pyprof2calltree/pyprof2calltree.py 2> /dev/null"

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

# -- open pdf file with evince --
# -- usage: pdfreader <file>
alias pdfreader="/usr/bin/evince"

# -- cmake for estools/builders/xsap --
# -- usage: cmake ..
alias cmake-xsap="cmake .. -DENABLE_LIBXML=ON -DBUILD_STATIC=OFF -DPREFER_STATIC_LIBRARIES=OFF"

# -- extract compressed files --
# -- usage: extract_* <file>
alias extract_tar_gz="tar -zxf"
alias extract_tar_xz="tar -xf"
alias extract_bz_2="tar -xjf"
alias extract_zip="unzip"

# -- runsnake without stderr --
# -- usage: runsnake <file>
alias runsnake="/usr/bin/runsnake 2> /dev/null"

# -- real path of current directory --
# -- usage: pwd
alias pwd="/bin/pwd -P"

# -- copy symbolic links --
# -- usage: cp <file> <file>
alias cp="/bin/cp -d"

# ------------------------------------------------------------------------ #
# OPTIONS                                                                  #
# ------------------------------------------------------------------------ #

# -- open file with gimp --
# -- usage: gimp <file>
alias gimp="/usr/bin/gimp &> /dev/null"

# -- open dia --
# -- usage: dia
alias dia="/usr/bin/dia &"

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
