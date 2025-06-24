# Reduce size of video (known supported formats: mp4, mov)
reduce-video() {
    name=${1%.*}
    ext=${1##*.}
    out=${name}_reduced.${ext}
    cmd="ffmpeg -i ${1} -vcodec libx265 -crf 28 ${out}"
    ${cmd}
    echo -e "\e[36m${out}"
}

# Converter from heic to jpg
heic-to-jpg() {
    name=${1%.*}
    out=${name}.jpg
    cmd="heif-convert ${1} ${out}"
    ${cmd}
    if [ $? -eq 0 ]; then
        echo -e "\e[36m${out}\e[0m"
    else
        echo -e "\e[31mError ${1}\e[0m"
    fi
}

heic-to-jpeg() {
    name=${1%.*}
    out=${name}.jpeg
    cmd="heif-convert ${1} ${out}"
    ${cmd}
    if [ $? -eq 0 ]; then
        echo -e "\e[36m${out}\e[0m"
    else
        echo -e "\e[31mError ${1}\e[0m"
    fi
}

# Latex
export PATH=${PATH}:/usr/local/texlive/2021/bin/x86_64-linux

# Blender
export PATH=${PATH}:${HOME}/.blender

# LibreOffice
alias soffice="libreoffice"

# PDF Studio
alias pdfstudio="${HOME}/.pdfstudio2024/pdfstudio2024"

# Screenshot
alias screenshot="gnome-screenshot --interactive"

# Locate a library
locatelib() {
    ldconfig -p | grep $@
}
