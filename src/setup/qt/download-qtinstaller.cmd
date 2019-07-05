::-----------------------------------------------------------------------------::
:: Name .........: download-qtiunstaller.cmd
:: Project ......: Part of the JTSDK64 Tools Project
:: Version ......: 3.1.0
:: Description ..: Downloads the latest QT Online Installer
:: Project URL ..: https://github.com/KI7MT/jtsdk64-tools-scripts.git
:: Usage ........: Call this file directly from the command line
::
:: Author .......: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
:: Copyright ....: Copyright (C) 2013-2019 Greg Beam, KI7MT
:: License ......: GPL-3
::
::-----------------------------------------------------------------------------::

:: Process variables
SETLOCAL
SET app_name=qt-unified-windows-x86-online.exe
SET app_url=https://download.qt.io/official_releases/online_installers/qt-unified-windows-x86-online.exe

ECHO.
ECHO  Downloading Qt Online Installer v%ver%
ECHO.
ECHO  This script downloads the latest Qt Online
ECHO  Installer using Curl.
ECHO.
curl -o %app_name% -J -L %app_url%
GOTO EOF

:EOF
ENDLOCAL
exit /b 0