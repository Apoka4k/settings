

##############################################################################
#                                                                            #
# DIRECTORIES                                                                #
#                                                                            #
##############################################################################

HOME_DIR=/home/sbicego

##############################################################################
#                                                                            #
# COLORS                                                                     #
#                                                                            #
##############################################################################

BLACK="\e[30m"
BLUE="\e[34m"
CYAN="\e[36m"
GREEN="\e[32m"
MAGENTA="\e[35m"
RED="\e[31m"
WHITE="\e[97m"
YELLOW="\e[33m"
COLOR_DEFAULT="\e[39m"

##############################################################################
#                                                                            #
# FUNCTIONS                                                                  #
#                                                                            #
##############################################################################

# STANDARD PRINTER
#
# USAGE:
# print <color> <string>
function print {
    case $1 in
        black)
            color=$BLACK
            message=$2
            ;;
        blue)
            color=$BLUE
            message=$2
            ;;
        cyan)
            color=$CYAN
            message=$2
            ;;
        green)
            color=$GREEN
            message=$2
            ;;
        magenta)
            color=$MAGENTA
            message=$2
            ;;
        red)
            color=$RED
            message=$2
            ;;
        white)
            color=$WHITE
            message=$2
            ;;
        yellow)
            color=$YELLOW
            message=$2
            ;;
        default)
            color=$COLOR_DEFAULT
            message=$2
            ;;
        *)
            color=$COLOR_DEFAULT
            message=$2
            ;;
    esac
    echo -e $color$message$COLOR_DEFAULT
}

# SUCCESS PRINTER
#
# USAGE:
# print_success <script_name>
function print_success {
    echo -e $COLOR_DEFAULT$""
    echo -e $GREEN$"        "$MAGENTA$"Success"$GREEN$":"
    echo -e $GREEN$"          the script "$YELLOW$1
    echo -e $GREEN$"          has been successfully executed."
    echo -e $COLOR_DEFAULT$""
}

##############################################################################
