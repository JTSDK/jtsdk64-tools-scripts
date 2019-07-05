::-----------------------------------------------------------------------------::
:: Name .........: download-git.cmd
:: Project ......: Part of the JTSDK64 Tools Project
:: Version ......: 3.1.0 Alpha
:: Description ..: Downloads the latest Git SCM Installer
:: Project URL ..: https://github.com/KI7MT/jtsdk64-tools-scripts.git
:: Usage ........: Call this file directly from the command line
::
:: Author .......: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
:: Copyright ....: Copyright (C) 2013-2019 Greg Beam, KI7MT
:: License ......: GPL-3
::-----------------------------------------------------------------------------::

:: Process variables
SETLOCAL
SET ver=2.22.0
SET app_name=Git-2.22.0-64-bit.exe
SET app_url=https://github.com/git-for-windows/git/releases/download/v2.22.0.windows.1/Git-2.22.0-64-bit.exe

ECHO.
ECHO  Downloading Git Win-64 Installer v%ver%
ECHO.
ECHO  This script downloads the Git SCM Win-64
ECHO  Installer using Curl.
ECHO.
curl -o %app_name% -J -L %app_url%
GOTO EOF

:EOF
ENDLOCAL
exit /b 0