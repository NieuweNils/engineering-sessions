echo "let's install something that is not packaged as a source distribution from PyPi"
echo "> python -m pip install 'uwsgi==2.0.*'"
python -m pip install 'uwsgi==2.0.*'
echo ""
echo "now let's install something that IS  packaged as a wheel from PyPi"
echo "> python -m pip install 'chardet==3.*'"
python -m pip install 'chardet==3.*'
echo ""
echo "--> python uses wheels, so source distributions are build to wheels before use"
echo "--> With source distributions, extension modules are compiled on the user’s side rather than the developer’s."
