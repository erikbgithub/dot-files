#your config comes here:
SRC_DIR=$(dir $(realpath $(lastword $(MAKEFILE_LIST))))
DEST_DIR=$(HOME)/
DIRS := .i3
FILES := .bash_aliases .bashrc .bash_profile .gitconfig .vim .vimrc .nvimrc .screenrc .hgrc .zshrc .i3/config


#generated, don't touch if not absolutely necessary
dest_DIRS := $(DIRS:%=$(DEST_DIR)%)
dest_FILES := $(FILES:%=$(DEST_DIR)%)

#some stuff for ease of handling things
phonies := clean mk_dirs install

.PHONY:  $(phonies)

all: $(phonies) set-nvim

$(dest_DIRS):
	mkdir -p $@

$(dest_FILES):
	-ln -s $(patsubst $(DEST_DIR).%, $(SRC_DIR).%, $@) $@

install: $(dest_FILES)

mk_dirs: $(dest_DIRS)

clean:
	-rm -rf $(dest_FILES)
	-rm -rf $(dest_DIRS)
