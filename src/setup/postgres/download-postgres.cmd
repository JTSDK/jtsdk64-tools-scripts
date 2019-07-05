::-----------------------------------------------------------------------------::
:: Name .........: download-postgres.cmd
:: Project ......: Part of the JTSDK64 Tools Project
:: Version ......: 3.1.0 Alpha
:: Description ..: Downloads the latest PostgreSQL installer
:: Project URL ..: https://github.com/KI7MT/jtsdk64-tools-scripts.git
:: Usage ........: Call this file directly from the command line
::
:: Author .......: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
:: Copyright ....: Copyright (C) 2013-2019 Greg Beam, KI7MT
:: License ......: GPL-3
::-----------------------------------------------------------------------------::

:: Process variables
SETLOCAL
SET ver=11.4.2
SET app_name=postgresql-11.4-2-windows-x64
SET app_url=https://get.enterprisedb.com/postgresql/postgresql-11.4-2-windows-x64.exe

ECHO.
ECHO  Downloading PostgreSQL Win-64 Installer v%ver%
ECHO.
ECHO  This script downloads the PostgreSQL Win-64
ECHO  Installer using Curl.
ECHO.
curl -o %app_name% -J -L %app_url%
GOTO EOF

:EOF
ENDLOCAL
exit /b 0