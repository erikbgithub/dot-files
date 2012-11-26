#!/bin/bash
# -*- coding: utf-8 -*-
#
# Init script for erikb85's dot files
#
###############

# where this script is coming from
THIS=$(realpath $(dirname $0))

# add vim config
rm ~/.vimrc
ln -s $THIS/.vimrc ~/.vimrc

# add shell config

echo "source $THIS/.bashrc" >>~/.bashrc
