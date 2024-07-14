#!/bin/bash

echo ==========
echo Download Python-3.7.9 embeddable zip file
echo ----------
curl -O https://www.python.org/ftp/python/3.7.9/python-3.7.9-embed-amd64.zip
unzip python-3.7.9-embed-amd64.zip
rm python-3.7.9-embed-amd64.zip

echo ==========
echo Set configuration files
echo ----------
echo "import site" >> python37._pth
echo "*.pyc" > .gitignore
echo "@ "%~dp0\\python.exe" -m pip %*" > pip.bat
echo "@ "%~dp0\\python.exe" -m idlealib %*" > idle.bat

echo ==========
echo Install pip
echo ----------
curl -O https://bootstrap-pypa-io.ingress.us-east-2.psfhosted.computer/pip/3.7/get-pip.py
./python.exe get-pip.py

echo ==========
echo Copy tkinter and idlelib
echo ----------
PYTHON_ROOT=$(py -3.7-64 -c "import sys; print(sys.prefix)")
echo $PYTHON_ROOT
cp -r "$PYTHON_ROOT/tcl" .
cp -r "$PYTHON_ROOT/Lib/tkinter" .
cp -r "$PYTHON_ROOT/Lib/idlelib" .
cp "$PYTHON_ROOT/DLLs/_tkinter.pyd" .
cp "$PYTHON_ROOT/DLLs/tcl86t.dll" .
cp "$PYTHON_ROOT/DLLs/tk86t.dll" .

echo ==========
echo Install lishixian lsx idlealib package
echo ----------
./python.exe -m pip install lishixian lsx idlea
./python.exe -m lishixian version
./python.exe -m idlealib

echo ==========
read -p "Press enter to exit..."
