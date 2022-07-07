# Python-portable

Python 3.6 64-bit embeddable with pip

## Step-by-step Guide

1. Download and unpack [python-3.6.8-embed-amd64.zip](https://www.python.org/ftp/python/3.6.8/python-3.6.8-embed-amd64.zip)
2. Download [get-pip.py](https://bootstrap.pypa.io/pip/3.6/get-pip.py)
3. Run `python get-pip.py`
4. Add `..` and `site` into `python36._pth`
5. Add `main.py`
6. Run `run.bat`

## Advance

7. Copy `tcl` and `tkinter` from `Python36` (including `~\tcl`, `~\Lib\tkinter`, `~\DLLs\_tkinter.pyd`, `~\DLLs\tcl86t.dll`, `~\DLLs\tk86t.dll`)
8. Copy `~\Python36\Lib\idlelib` to `~\python\idlelib`
9. pip install `idlea` for a better `IDLE`
10. Use `IDLE.bat` to start up
