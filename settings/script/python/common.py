
# =========================================================================== #
# imports                                                                     #
# =========================================================================== #

# imports
import os
import shutil
import sys


# =========================================================================== #
# colors                                                                      #
# =========================================================================== #

class color:

    # normal
    blue = "\033[0;34m"
    cyan = "\033[0;36m"
    gray = "\033[0;30m"
    green = "\033[0;32m"
    light_green = "\033[0;38m"
    pink = "\033[0;35m"
    red = "\033[0;31m"
    white = "\033[0;37m"
    yellow = "\033[0;33m"

    # bold
    bblue = "\033[1;34m"
    bcyan = "\033[1;36m"
    bgray = "\033[1;30m"
    bgreen = "\033[1;32m"
    blight_green = "\033[1;38m"
    bpink = "\033[1;35m"
    bred = "\033[1;31m"
    bwhite = "\033[1;37m"
    byellow = "\033[1;33m"

    # default
    default = "\033[0;m"

# end color


# =========================================================================== #
# chars                                                                       #
# =========================================================================== #

alphanumeric_chars = "abcdefghijklmnopqrstuvwxyz" \
                     "ABCDEFGHIJKLMNOPQRSTUVWXYZ" \
                     "0123456789" \
                     "_"


# =========================================================================== #
# functions                                                                   #
# =========================================================================== #

# check if string alphanumeric and nonempty
def alphanumeric(string):

    if string == "":
        return False

    for char in string:
        if char not in alphanumeric_chars:
            return False

    return True


# glue paths
def path_glue(*path_tuple):

    path_list = list(path_tuple)

    glued_path = ""
    for path in path_list:
        glued_path = os.path.normpath(os.path.join(glued_path, path))
    return glued_path


# get command
def command(*item_tuple):

    item_list = list(item_tuple)

    if item_list == []:
        return ""
    else:
        cmd = item_list[0]
        item_list = item_list[1:]
        for item in item_list:
            cmd += " " + item
        return cmd


# integer checker
def integer(number):

    try:
        int(number)
        return True
    except:
        return False


# strictly positive integer checker
def positive_integer(number):

    try:
        assert(int(number) >= 1)
        return True
    except:
        return False


# positive or null integer checker
def positive_null_integer(number):

    try:
        assert(int(number) >= 0)
        return True
    except:
        return False


# clear string
def clear_string(string):

    if string == "":
        return ""
    else:
        while string[0] in [" ", "\n"]:
            string = string[1:]
            if string == "":
                return ""

    if string == "":
        return ""
    else:
        while string[-1] in [" ", "\n"]:
            string = string[:-1]
            if string == "":
                return ""

    return string


# remove file
def rm_file(file_path):

    if os.path.isfile(file_path):
        os.unlink(file_path)


# remove directory content
def rm_dir_content(dir_path):

    for item in os.listdir(dir_path):
        item_path = path_glue(dir_path, item)
        if os.path.isfile(item_path):
            os.unlink(item_path)
        elif os.path.isdir(item_path):
            shutil.rmtree(item_path)


# get files contained in directory
def get_dir_content(dir_path):

    files = []

    for item in os.listdir(dir_path):
        item_path = path_glue(dir_path, item)
        if os.path.isfile(item_path):
            files.append(item_path)

    return files


# copy directory and its content
def cp_dir(src_dir, tgt_dir_env):

    tgt_dir = path_glue(tgt_dir_env, os.path.basename(src_dir))
    shutil.copytree(src_dir, tgt_dir)


# replace all path dots with underscores
def fix_dots(tgt_dir_env):

    subdirs_list = [subdirs
                    for (dir_name, subdirs, _) in os.walk(tgt_dir_env)
                    if dir_name == tgt_dir_env]
    subdirs = []
    for i in subdirs_list:
        subdirs += i

    files_list = [f
                  for (dir_name, subdir, f) in os.walk(tgt_dir_env)
                  if dir_name == tgt_dir_env]
    files = []
    for i in files_list:
        files += i

    for f in files:
        new_f = ""
        dots = True
        for char in f:
            if dots is True and char == ".":
                char = "_"
            else:
                dots = False
            new_f += char
        f_path = path_glue(tgt_dir_env, f)
        new_f_path = path_glue(tgt_dir_env, new_f)
        shutil.move(f_path, new_f_path)

    for d in subdirs:
        new_d = ""
        dots = True
        for char in d:
            if dots is True and char == ".":
                char = "_"
            else:
                dots = False
            new_d += char
        d_path = path_glue(tgt_dir_env, d)
        new_d_path = path_glue(tgt_dir_env, new_d)
        shutil.move(d_path, new_d_path)
        fix_dots(new_d_path)


# copy file
def cp_file(src_file, tgt_dir):

    shutil.copy(src_file, tgt_dir)


# remove directory
def rm_dir(dir_path):

    if os.path.isdir(dir_path):
        shutil.rmtree(dir_path)


# get file extension
def extension(fname):

    ext = (os.path.splitext(fname))[1]
    if "." in ext:
        ext = (ext.split("."))[1]

    return ext


# add a postfix to the file name
def add_postfix(src_path, postfix):

    base_path = (os.path.splitext(src_path))[0]
    extension = (os.path.splitext(src_path))[1]

    out_path = base_path + postfix + extension

    return out_path


# =========================================================================== #
# messages                                                                    #
# =========================================================================== #

# get error message
def get_err_msg(abs_fname):

    short_fname = os.path.basename(abs_fname)

    text = color.green + "\n" + \
        " " * 8 + \
        color.pink + "Error" + \
        color.green + ":" + "\n" + \
        " " * 10 + \
        "An error occurred executing the following script:" + "\n\n" + \
        " " * 9 + \
        color.yellow + "name" + \
        color.green + ": " + \
        color.cyan + get_bounded_text(short_fname, 15, 79) + \
        color.green + "\n" + \
        " " * 9 + \
        color.yellow + "path" + \
        color.green + ": " + \
        color.cyan + get_bounded_text(abs_fname, 15, 79) + \
        color.green + "\n" + \
        color.default

    return text


# get success message
def get_succ_msg(abs_fname):

    short_fname = os.path.basename(abs_fname)

    text = color.green + "\n" + \
        " " * 8 + \
        color.pink + "Success" + \
        color.green + ":" + "\n" + \
        " " * 10 + \
        "the script " + \
        color.yellow + get_bounded_text(short_fname, 21, 79) + \
        color.green + "\n" + \
        " " * 10 + \
        color.green + "has been successfully executed." + "\n" + \
        color.default

    return text


# get text with bounds
def get_bounded_text(text, start_len, end_len):

    text_len = len(text)
    line_len = end_len - start_len

    out_text = text[:line_len] + "\n"
    lines = 1
    while (line_len * lines < text_len):
        out_text += " " * start_len + \
                    text[(line_len * lines):
                         (line_len * (lines + 1))] + "\n"
        lines += 1

    if out_text[-1] == "\n":
        out_text = out_text[:-1]

    return out_text


# communicate results
def show_results(res, abs_fname):

    # check results
    if res != 0:
        print get_err_msg(abs_fname)
        sys.exit()
    else:
        print get_succ_msg(abs_fname)
        sys.exit()


# get show usage
def get_show_usage(script_name, mandatory_args, optional_args):

    # fix script name
    script_name = os.path.basename(script_name)

    # get usage text
    usage_text = color.yellow + script_name + \
        color.default

    for arg in mandatory_args:
        usage_text += color.yellow + " "
        if type(arg) == list:
            if arg != []:
                usage_text += color.green + arg[0]
                for subarg in arg[1:]:
                    usage_text += color.yellow + "|" + \
                        color.green + subarg
        else:
            usage_text += color.green + arg + \
                color.default

    for arg in optional_args:
        usage_text += color.yellow + " ["
        if type(arg) == list:
            if arg != []:
                usage_text += color.green + arg[0]
                for subarg in arg[1:]:
                    usage_text += color.yellow + "|" + \
                        color.green + subarg
                usage_text += color.yellow + "]"
        else:
            usage_text += color.green + arg + \
                color.yellow + "]" + \
                color.default

    # get text
    text = color.green + " " * 8 + \
        color.pink + "Usage" + \
        color.green + ":" + "\n" + \
        " " * 10 + \
        usage_text + "\n" + \
        color.default

    return text


# show usage
def show_usage(script_name, mandatory_args, optional_args):

    print get_show_usage(script_name, mandatory_args, optional_args)
    sys.exit()


# get titled message
def get_lines_msg(title, line_list):

    text = color.default + " " * 4 + \
        color.blue + clear_string(title) + \
        color.green + ":" + \
        color.default + "\n\n"

    for line in line_list:

        text += color.default + " " * 2 + \
            color.cyan + clear_string(line) + \
            color.default + "\n"

    return text


# get separator line
def get_separator():

    text = color.yellow + "-" * 78 + \
        color.default + "\n"

    return text


# =========================================================================== #
# paths                                                                       #
# =========================================================================== #

# home path
home = "/home/apoka"

# script dir
script_dir = path_glue(home, "script")

# shared dir
shared_dir = path_glue(home, "shared")

# repository root path
rep_root = path_glue(home, "rep")

# settings repository path
settings_rep = path_glue(rep_root, "settings")

# manual repository path
manual_rep = path_glue(rep_root, "manual")


# =========================================================================== #
# backup                                                                      #
# =========================================================================== #

class Backup():

    def __init__(self):

        self.backup_list = []

        # emacs files
        emacs_paths = {}
        emacs_paths["file"] = [path_glue(home, ".emacs")]
        emacs_paths["dir"] = []
        emacs_paths["tgt_dir"] = "emacs"
        self.backup_list.append(emacs_paths)

        # bash files
        bash_paths = {}
        bash_paths["file"] = [path_glue(home, ".bashrc"),
                              path_glue(home, ".bash_aliases"),
                              "/usr/etc/git/git-prompt.sh"]
        bash_paths["dir"] = []
        bash_paths["tgt_dir"] = "bash"
        self.backup_list.append(bash_paths)

        # input files
        input_paths = {}
        input_paths["file"] = [path_glue(home, ".inputrc")]
        input_paths["dir"] = []
        input_paths["tgt_dir"] = "input"
        self.backup_list.append(input_paths)

        # script files
        script_paths = {}
        script_paths["file"] = [path_glue(script_dir, "import.sh")]
        script_paths["dir"] = [path_glue(script_dir, "python")]
        script_paths["tgt_dir"] = "script"
        self.backup_list.append(script_paths)

        # backup dir
        self.backup_dir = path_glue(settings_rep, "settings")

    def do_backup(self):

        rm_dir(self.backup_dir)
        os.makedirs(self.backup_dir)

        for obj in self.backup_list:
            tgt_dir = path_glue(self.backup_dir, obj["tgt_dir"])
            os.makedirs(tgt_dir)
            for src_dir in obj["dir"]:
                cp_dir(src_dir, tgt_dir)
            for src_file in obj["file"]:
                cp_file(src_file, tgt_dir)
            fix_dots(tgt_dir)

# end Backup


# =========================================================================== #
