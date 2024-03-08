#!/bin/bash

echo "> python main/main.py"
python main/main.py
echo ""
echo "> python sys_path.py"
python sys_path.py
echo ""
echo "> python -m hello"
python -m hello
echo ""
echo "> python -m only_import"
python -m only_import
echo ""
echo "> python -m mod"
python -m mod
echo ""
echo "> python -m mod.package"
python -m mod.package
echo ""
echo "> python -m mod.package.subpackage"
python -m mod.package.subpackage
echo ""
echo "> python check_your_dir.py"
python check_your_dir.py
echo ""
echo "> python -m main"
python -m main
