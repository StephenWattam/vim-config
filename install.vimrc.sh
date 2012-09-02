#!/bin/bash

# 
# Step 1: Check for the user's existing vimrc,
#         move it to .vimrc.local so it is merged
#         with the new one (run after it)
#
if [ -f "~/.vimrc" ]
then
    echo "Moving old vimrc to ~/.vimrc.local"
    mv ~/.vimrc ~/.vimrc.local
fi

#
# Step 2: Symlink ~/.vimrc into this repository
#         so that it is updated using the usual
#         git pull
#
echo "Symlinking vimrc from `pwd` to ~/.vimrc"
ln -s "`pwd`/.vimrc" ~/.vimrc
ln -s "`pwd`/.vimrc" ~/.gvimrc

echo "Done."
