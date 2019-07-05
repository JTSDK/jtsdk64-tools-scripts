::-----------------------------------------------------------------------------::
:: Name .........: download-vscode.cmd
:: Project ......: Part of the JTSDK64 Tools Project
:: Version ......: 3.1.0
:: Description ..: Downloads the latest VS Code Istaller
:: Project URL ..: https://github.com/KI7MT/jtsdk64-tools-scripts.git
:: Usage ........: Call this file directly from the command line
::
:: Author .......: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
:: Copyright ....: Copyright (C) 2013-2019 Greg Beam, KI7MT
:: License ......: GPL-3
::-----------------------------------------------------------------------------::

:: Process variables
SETLOCAL
SET app_name=VSCodeUserSetup-x64.exe
SET app_url=https://aka.ms/win32-x64-user-stable

ECHO.
ECHO  Downloading VS Code Installer
ECHO.
ECHO  This script downloads the latest VS Code
ECHO  Installer using Curl.
ECHO.
curl -o %app_name% -J -L %app_url%
GOTO EOF

:EOF
ENDLOCAL
exit /b 0