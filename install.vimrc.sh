#!/bin/bash

echo "Symlinking vimrc from `pwd` to ~/.vimrc"
ln -s "`pwd`/.vimrc" ~/.vimrc
ln -s "`pwd`/.vimrc" ~/.gvimrc

echo "Done."
