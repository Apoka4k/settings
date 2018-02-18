
# directories visitor
function visit
{
    # export current directory
    export PATH="$1:$PATH"

    # move to current directory
    cd $1

    # get subdirectories
    LS="$(ls -d $1/*/ 2>/dev/null)"

    # visit subdirectories
    for SUBDIR in $LS
    do
        visit $SUBDIR
    done
}

# save current user working directory
TMP_PWD=$PWD

# get self relative path with respect to user working directory
EXE_REL_PATH=$BASH_SOURCE

# get self relative directory
EXE_REL_DIR=$(dirname $EXE_REL_PATH)

# move to self directory
cd $EXE_REL_DIR

# move to python scripts directory
cd python

# get python scripts absolute directory
SELF_DIR=$PWD

# visit directory
visit $SELF_DIR

# restore user working directory
cd $TMP_PWD
