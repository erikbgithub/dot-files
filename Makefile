#your config comes here:
SRC_DIR=$(dir $(realpath $(lastword $(MAKEFILE_LIST))))
DEST_DIR=$(HOME)/
FILES := .bash_aliases .bashrc .bash_profile .gitconfig .vim .vimrc .screenrc .hgrc .zshrc .zsh-update


#generated, don't touch if not absolutely necessary
dest_FILES := $(FILES:%=$(DEST_DIR)%)

#some stuff for ease of handling things
phonies := clean install

.PHONY:  $(phonies)

all: $(phonies)

$(dest_FILES):
	-ln -s $(patsubst $(DEST_DIR).%, $(SRC_DIR).%, $@) $@

install: $(dest_FILES)

clean:
	-rm -rf $(dest_FILES)
