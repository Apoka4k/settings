
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
    blue = "\033[0;34m"
    cyan = "\033[0;36m"
    gray = "\033[0;30m"
    green = "\033[0;32m"
    light_green = "\033[0;38m"
    pink = "\033[0;35m"
    red = "\033[0;31m"
    white = "\033[0;37m"
    yellow = "\033[0;33m"
    END = "\033[0;m"

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
        color.END

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
        color.END

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
        color.END

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
                color.END

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
                color.END

    # get text
    text = color.green + " " * 8 + \
        color.pink + "Usage" + \
        color.green + ":" + "\n" + \
        " " * 10 + \
        usage_text + "\n" + \
        color.END

    return text


# show usage
def show_usage(script_name, mandatory_args, optional_args):

    print get_show_usage(script_name, mandatory_args, optional_args)
    sys.exit()


# get titled message
def get_lines_msg(title, line_list):

    text = color.END + " " * 4 + \
        color.blue + clear_string(title) + \
        color.green + ":" + \
        color.END + "\n\n"

    for line in line_list:

        text += color.END + " " * 2 + \
            color.cyan + clear_string(line) + \
            color.END + "\n"

    return text


# get separator line
def get_separator():

    text = color.yellow + "-" * 78 + \
        color.END + "\n"

    return text


# =========================================================================== #
# paths                                                                       #
# =========================================================================== #

# home path
home = "/home/sbicego"

# settings repository root path
rep_root = path_glue(home, "Desktop/settings")

# personal repository root path
personal_rep_root = path_glue(home, "Desktop/sbicego")

# korein root path
korein_root = path_glue("/es0", "sbicego")

# cube shared folder root path
cube_shared_root = path_glue(home, "shared")

# korein shared folder root path
korein_shared_root = path_glue(korein_root, "default")


# =========================================================================== #
# backup                                                                      #
# =========================================================================== #

class Backup():

    def __init__(self):

        self.backup_list = []

        # emacs files
        emacs_paths = {}
        emacs_paths["file"] = [path_glue(home, ".emacs")]
        emacs_paths["dir"] = [path_glue(home, "emacs")]
        emacs_paths["tgt_dir"] = "emacs"
        self.backup_list.append(emacs_paths)

        # bash files
        bash_paths = {}
        bash_paths["file"] = [path_glue(home, ".bashrc")]
        bash_paths["dir"] = [path_glue(home, "bash")]
        bash_paths["tgt_dir"] = "bash"
        self.backup_list.append(bash_paths)

        # script files
        script_paths = {}
        script_paths["file"] = []
        script_paths["dir"] = [path_glue(home, "scripts")]
        script_paths["tgt_dir"] = "script"
        self.backup_list.append(script_paths)

        # git files
        git_paths = {}
        git_paths["file"] = [path_glue(home, ".gitconfig")]
        git_paths["dir"] = []
        git_paths["tgt_dir"] = "git"
        self.backup_list.append(git_paths)

        # input files
        input_paths = {}
        input_paths["file"] = [path_glue(home, ".inputrc")]
        input_paths["dir"] = []
        input_paths["tgt_dir"] = "input"
        self.backup_list.append(input_paths)

        # latex files
        latex_paths = {}
        latex_paths["file"] = []
        latex_paths["dir"] = [path_glue(home, "texmf")]
        latex_paths["tgt_dir"] = "latex"
        self.backup_list.append(latex_paths)

        # repository backup root
        self.repository_backup_root = path_glue(rep_root, "settings")

    def do_backup(self):

        rm_dir(self.repository_backup_root)
        os.makedirs(self.repository_backup_root)

        for obj in self.backup_list:
            tgt_dir = path_glue(self.repository_backup_root, obj["tgt_dir"])
            os.makedirs(tgt_dir)
            for src_dir in obj["dir"]:
                cp_dir(src_dir, tgt_dir)
            for src_file in obj["file"]:
                cp_file(src_file, tgt_dir)
            fix_dots(tgt_dir)

# end Backup


# =========================================================================== #
