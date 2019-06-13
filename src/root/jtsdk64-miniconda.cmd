::-----------------------------------------------------------------------------::
:: Name .........: jtsdk64.cmd
:: Project ......: Part of the JTSDK64 Tools Project
:: Version ......: 3.1.0 Alpha
:: Description ..: Main Environment Script
:: Project URL ..: https://github.com/KI7MT
:: Usage ........: Call this file directly, or from command line
::
:: Author .......: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
:: Copyright ....: Copyright (C) 2013-2019 Greg Beam, KI7MT
:: License ......: GPL-3
::
:: jtsdk64.cmd is free software: you can redistribute it and/or modify it
:: under the terms of the GNU General Public License as published by the Free
:: Software Foundation either version 3 of the License, or (at your option) any
:: later version. 
::
:: jtsdk64.cmd is distributed in the hope that it will be useful, but WITHOUT
:: ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
:: FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
:: details.
::
:: You should have received a copy of the GNU General Public License
:: along with this program.  If not, see <http://www.gnu.org/licenses/>.
::-----------------------------------------------------------------------------::
@ECHO OFF
SET JTSDK_VERSION=3.1.0 Alpha
@chcp 1252 >NUL 2>&1
@SET LANG=en_US
SET version=%JTSDK_VERSION%
TITLE JTSDK64 Miniconda %version%

::------------------------------------------------------------------------------
:: GLOBAL ENVIRONMENT VARIABLES and PATHS
::------------------------------------------------------------------------------

SET JTSDK_HOME=%CD%
SET JTSDK_MINICONDA=%JTSDK_HOME%\tools\python
DOSKEY setup-jtpy = call %JTSDK_HOME%\tools\scripts\cmd\setup-jtpy.cmd

:: activate the python environment
call "%JTSDK_MINICONDA%\Scripts\activate.bat" "%JTSDK_MINICONDA%"

:: conditional check if JTPY exists
IF EXIST "%JTSDK_MINICONDA%\envs\jtpy\python.exe" (
call conda activate jtpy
GOTO EOF
)
GOTO CREATE_JTPY

:: If JTPY does not exist, display this message
:CREATE_JTPY
ECHO.
ECHO --------------------------------------------
ECHO  Create JTPY Environment
ECHO --------------------------------------------
ECHO.
ECHO  To fininsh the JTSDK-Tools Installation,
ECHO  the virtual environment ^( jtpy ^) needs
ECHO  to be created.
ECHO.
ECHO  Issue the following command^: setup-jtpy
ECHO.
ECHO.
GOTO EOF

:EOF
%WINDIR%\System32\cmd.exe /A /Q /K