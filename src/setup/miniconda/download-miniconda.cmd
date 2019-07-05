::-----------------------------------------------------------------------------::
:: Name .........: download-miniconda.cmd
:: Project ......: Part of the JTSDK64 Tools Project
:: Version ......: 3.1.0
:: Description ..: Downloads the latest Miniconda installer
:: Project URL ..: https://github.com/KI7MT/jtsdk64-tools-scripts.git
:: Usage ........: Call this file directly from the command line
::
:: Author .......: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
:: Copyright ....: Copyright (C) 2013-2019 Greg Beam, KI7MT
:: License ......: GPL-3
::-----------------------------------------------------------------------------::

:: Process variables
SETLOCAL
SET app_name=Miniconda3-latest-Windows-x86_64.exe
SET app_url=https://repo.anaconda.com/miniconda/Miniconda3-latest-Windows-x86_64.exe

ECHO.
ECHO  Downloading Latest Miniconda Installer
ECHO.
ECHO  This script downloads the latest version of
ECHO  the Miniconda installer package using Curl.
ECHO.
curl -o %app_name% %app_url%
GOTO EOF

:EOF
ENDLOCAL
exit /b 0
