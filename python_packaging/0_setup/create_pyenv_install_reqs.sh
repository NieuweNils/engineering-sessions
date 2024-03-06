#!/bin/bash
pyenv install 3.11.3
pyenv virtualenv 3.11.3 module_example
. ${PYENV_ROOT}/versions/module_example/bin/activate
pyenv local module_example

pip install --upgrade pip
pip install -r requirements.txt
