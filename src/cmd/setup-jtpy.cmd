@ECHO OFF
::-----------------------------------------------------------------------------::
:: Name .........: setup-jtpy.cmd
:: Project ......: Part of the JTSDK64 Tools Project
:: Version ......: 3.1.0 Alpha
:: Description ..: Setup JTPY Environment
:: Project URL ..: https://github.com/KI7MT
:: Usage ........: Call this file directly, or from command line
::
:: Author .......: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
:: Copyright ....: Copyright (C) 2013-2019 Greg Beam, KI7MT
:: License ......: GPL-3
::
:: setup-jtpy is free software: you can redistribute it and/or modify it
:: under the terms of the GNU General Public License as published by the Free
:: Software Foundation either version 3 of the License, or (at your option) any
:: later version. 
::
:: setup-jtpy is distributed in the hope that it will be useful, but WITHOUT
:: ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
:: FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
:: details.
::
:: You should have received a copy of the GNU General Public License
:: along with this program.  If not, see <http://www.gnu.org/licenses/>.
::-----------------------------------------------------------------------------::

SET JTSDK_VERSION=3.1.0 Alpha
@chcp 1252 >NUL 2>&1
@SET LANG=en_US

:: Start installation
ECHO.
ECHO --------------------------------------------
ECHO  Creating JTPY Environment
ECHO --------------------------------------------

:: update conda
ECHO.
ECHO ^[ Updating Conda ^]
call conda update conda
IF %ERRORLEVEL% EQU 0 (GOTO CREATE_JTPY)
IF %ERRORLEVEL% EQU 1 (GOTO CONDA_UPDATE_ERROR)

:CREATE_JTPY
ECHO.
ECHO ^[ Creating JTPY Environment ^]
call conda create -y -n jtpy python=3
IF %ERRORLEVEL% EQU 0 (GOTO ACTIVATE_JTPY)
IF %ERRORLEVEL% EQU 1 (GOTO CONDA_CREATE_ERROR)

:ACTIVATE_JTPY
ECHO.
ECHO ^[ Activating JTPY Environment ^]
call conda activate jtpy
IF %ERRORLEVEL% EQU 0 (GOTO UPDATE_PIP)
IF %ERRORLEVEL% EQU 1 (GOTO JTPY_ACTIVATE_ERROR)

:UPDATE_PIP
ECHO.
ECHO ^[ Updating PIP ^]
call pip install --upgrade pip
IF %ERRORLEVEL% EQU 0 (GOTO INSTALL_DEPS)
IF %ERRORLEVEL% EQU 1 (GOTO JTPY_ACTIVATE_ERROR)

:INSTALL_DEPS
ECHO.
ECHO ^[ Installing Dependencies ^]
ECHO.
call pip install -r %JTSDK_HOME%\tools\scripts\cmd\requirements.txt
IF %ERRORLEVEL% EQU 0 (GOTO INSTALLED_PKGS)
IF %ERRORLEVEL% EQU 1 (GOTO PIP_INSTALL_ERROR)

:INSTALLED_PKGS
ECHO.
ECHO ^[ Installed Python Packages ^]
call pip list
GOTO EOF

:: End of Script
:EOF
ECHO.
ECHO Finished Installing JTPY
ECHO.
exit /b 0

:: -----------------------------------------------------------------------------
:: ERROR MESSAGES
:: -----------------------------------------------------------------------------

:CONDA_CREATE_ERROR
ECHO.
ECHO Conda Create Error: The conda create script exited with
ECHO a non 0 status. Check Installaiton or email for support.
ECHO.
exit /b 1

:CONDA_UPDATE_ERROR
ECHO.
ECHO Conda Update Error: The conda update script exited with
ECHO a non 0 status. Check Installaiton or email for support.
ECHO.
exit /b 1

:JTPY_ACTIVATE_ERROR
ECHO.
ECHO JTPY Activation Error: The activation script exited with
ECHO a non 0 status. Check Installaiton or email for support.
ECHO.
exit /b 1

:PIP_INSTALL_ERROR
ECHO.
ECHO PIP Installation Error: The pip installation exited with
ECHO a non 0 status. Check Installaiton or email for support.
ECHO.
exit /b 1