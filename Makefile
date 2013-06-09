#your config comes here:
SRC_DIR=$(dir $(realpath $(lastword $(MAKEFILE_LIST))))
DEST_DIR=$(HOME)/
FILES := .bash_aliases .bashrc .bash_profile .gitconfig .vimrc .screenrc


#generated, don't touch if not absolutely necessary
dest_FILES := $(FILES:%=$(DEST_DIR)%)

#awesome window manager specific things
awesome_config_path=$(DEST_DIR).config/awesome/

#some stuff for ease of handling things
phonies := clean clean-awesome install awesome

.PHONY:  $(phonies)

all: $(phonies)

$(dest_FILES):
	-ln -s $(patsubst $(DEST_DIR).%, $(SRC_DIR).%, $@) $@

install: $(dest_FILES)

awesome:
	mkdir -p $(awesome_config_path)
	-ln -s $(SRC_DIR)awesome-rc.lua $(awesome_config_path)rc.lua

clean-awesome:
	-rm -R $(awesome_config_path)

clean:
	-rm $(dest_FILES)
