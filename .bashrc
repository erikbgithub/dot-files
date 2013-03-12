PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u\[\033[00m\]:\[\033[01;32m\]\t\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '
export LANG=en_US.UTF-8 #this way screen will also start wtih utf8
export EDITOR=vim

source .bash_aliases

devshell() {
    if [ -z "$1" ]; then
        echo "need to set param: <recipe-name>"
    else
        cd ~/coding/HidaV
        . ./hidav-init.sh .
        bitbake -c devshell $1
    fi
}

sdcard() {
    [-z $1] && 1=/dev/sdc
    cd ~/coding/Hidav
    . ./hidav-init.sh .
    cd ./tmp-eglibc/deploy/images/hidav-ti81xx
    ./ti814x-bootable-sdcard.sh $1
}

ertex() {
    if [ -z "$1" ]; then
        echo "need to set param: <filename>"
    else
        pdflatex $1.tex -interaction=nonstopmode
        bibtex $1.aux
        pdflatex $1.tex -interaction=nonstopmode
        pdflatex $1.tex -interaction=nonstopmode
    fi
}
