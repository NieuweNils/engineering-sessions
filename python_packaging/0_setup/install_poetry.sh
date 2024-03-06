curl -sSL https://install.python-poetry.org | python3 -
poetry completions bash >> ~/.bash_completion


mkdir $ZSH_CUSTOM/plugins/poetry
poetry completions zsh > $ZSH_CUSTOM/plugins/poetry/_poetry
