#!/bin/bash

curl -sSL https://install.python-poetry.org | python3 -

[[ $(type -P "poetry") ]] && echo "poetry is in PATH"  ||
    { echo "poetry is NOT in PATH, adding it to ~/.zshrc"  && (echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc) 1>&2;}

poetry completions bash >> ~/.bash_completion

#sudo mkdir ~/.oh-my-zsh/custom/plugins/poetry
#sudo poetry completions zsh > ~/.oh-my-zsh/custom/plugins/poetry/_poetry
# also add the poetry plugin to zsh