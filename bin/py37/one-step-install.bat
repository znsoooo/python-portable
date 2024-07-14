@echo off

echo ==========
echo Download Python-3.7.9 embeddable zip file
echo ----------
curl -O https://www.python.org/ftp/python/3.7.9/python-3.7.9-embed-amd64.zip
powershell -Command "Expand-Archive -Path python-3.7.9-embed-amd64.zip -DestinationPath ."
del python-3.7.9-embed-amd64.zip

echo ==========
echo Set configuration files
echo ----------
echo import site>>python37._pth
echo *.pyc>.gitignore
echo @ "%%~dp0\python.exe" -m pip %%*>pip.bat
echo @ "%%~dp0\python.exe" -m idlealib %%*>idle.bat

echo ==========
echo Install pip
echo ----------
curl -O https://bootstrap-pypa-io.ingress.us-east-2.psfhosted.computer/pip/3.7/get-pip.py
python.exe get-pip.py

echo ==========
echo Copy tkinter and idlelib
echo ----------
for /f "tokens=*" %%i in ('py -3.7-64 -c "import sys; print(sys.prefix)"') do set PYTHON_ROOT=%%i
echo %PYTHON_ROOT%
xcopy /e /i /q "%PYTHON_ROOT%\tcl" tcl
xcopy /e /i /q "%PYTHON_ROOT%\Lib\tkinter" tkinter
xcopy /e /i /q "%PYTHON_ROOT%\Lib\idlelib" idlelib
copy "%PYTHON_ROOT%\DLLs\_tkinter.pyd" .
copy "%PYTHON_ROOT%\DLLs\tcl86t.dll" .
copy "%PYTHON_ROOT%\DLLs\tk86t.dll" .

echo ==========
echo Install lishixian lsx idlealib package
echo ----------
python.exe -m pip install lishixian lsx idlea
python.exe -m lishixian version
python.exe -m idlealib

echo ==========
pause
