#!/bin/bash
pyenv install 3.11.3
pyenv virtualenv 3.11.3 asyncio
. ${PYENV_ROOT}/versions/asyncio/bin/activate
pyenv local asyncio

pip install --upgrade pip
pip install -r requirements.txt
