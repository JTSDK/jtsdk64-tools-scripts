::-----------------------------------------------------------------------------::
:: Name .........: jtsdk64-tools-setup.cmd
:: Project ......: Part of the JTSDK64 Tools Project
:: Version ......: 3.1.0 Alpha
:: Description ..: Main Environment Script
:: Project URL ..: https://github.com/KI7MT
:: Usage ........: Call this file directly from the command line
::
:: Author .......: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
:: Copyright ....: Copyright (C) 2013-2019 Greg Beam, KI7MT
:: License ......: GPL-3
::
:: jtsdk64-tools-setup is free software: you can redistribute it and/or modify it
:: under the terms of the GNU General Public License as published by the Free
:: Software Foundation either version 3 of the License, or (at your option) any
:: later version.
::
:: jtsdk64-tools-setup is distributed in the hope that it will be useful, but WITHOUT
:: ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
:: FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
:: details.
::
:: You should have received a copy of the GNU General Public License
:: along with this program.  If not, see <http://www.gnu.org/licenses/>.
::-----------------------------------------------------------------------------::
@ECHO OFF
SET /P JTSDK64_VERSION=<%CD%\ver.jtsdk
@chcp 1252 >NUL 2>&1
@SET LANG=en_US
SET version=0.0.1
TITLE JTSDK64 Tools Setup %version%

::------------------------------------------------------------------------------
:: GLOBAL ENVIRONMENT VARIABLES and PATHS
::------------------------------------------------------------------------------

:: Paths
SET JTSDK64_HOME=%CD%
SET TOOLS_DIR=%JTSDK64_HOME%\tools
SET SETUP_DIR=%JTSDK64_HOME%\tools\setup
SET CURL_DIR=%SETUP_DIR%\curl\bin

:: Global Environment Variables Variables
SET GIT_INSTALL_DIR=%PROGRAMFILES%\Git
SET DOTNET_INSTALL_DIR=%PROGRAMFILES%\dotnet
SET DOTNET_INSTALL_DIR=%PROGRAMFILES%\dotnet
SET PYTHON_INSTALL_DIR=%TOOLS_DIR%\python
SET QT_INSTALL_DIR=%TOOLS_DIR%\Qt
SET PGSQL_INSTALL_DIR=%TOOLS_DIR%\PostgreSQL\11
SET PGSQL_DATA_DIR=%TOOLS_DIR%\PostgreSQL\11\data
SET JAVA_INSTALL_DIR=%TOOLS_DIR%\java
SET PATH=%JTSDK64_HOME%;%TOOLS_DIR%;%SETUP_DIR%;%CURL_DIR%;%PATH%

::------------------------------------------------------------------------------
:: TOOL INSTALL VALIDATION
::------------------------------------------------------------------------------

:: Set Initial tool status
SET GIT_STATUS=Not Installed
SET PYTHON_STATUS=Not Installed
SET JTPY_STATUS=Not Installed
SET PGSQL_STATUS=Not Installed
SET QTMAINT_STATUS=Not Installed
SET QTCREATOR_STATUS=Not Installed
SET GCC73_STATUS=Not Installed
SET QT5122_STATUS=Not Installed
SET QT5123_STATUS=Not Installed
SET QT5124_STATUS=Not Installed
SET QT5130_STATUS=Not Installed
SET DOTNET_STATUS=Not Installed
SET JAVA_STATUS=Not Installed
GOTO APP_CHECK

:APP_CHECK
ECHO Gather tool^chain data, please wait...
git --version >NUL 2>&1
IF %ERRORLEVEL% == 0 ( SET GIT_STATUS=Installed )

dotnet --version >NUL 2>&1
IF %ERRORLEVEL% == 0 ( SET DOTNET_STATUS=Installed )

java -version >NUL 2>&1
IF %ERRORLEVEL% == 0 ( SET JAVA_STATUS=Installed )

:: Check for Python
IF EXIST "%TOOLS_DIR%\python\python.exe" ( SET PYTHON_STATUS=Installed)

:: Activate Miniconda Python Environment
IF EXIST "%TOOLS_DIR%\python\Scripts\activate.bat" (
    call %TOOLS_DIR%\python\Scripts\activate.bat D:\JTSDK64-Tools\tools\python
)

:: Activate JTPY
IF EXIST "%TOOLS_DIR%\python\envs\jtpy\python.exe" (
    call conda activate jtpy
    SET JTPY_STATUS=Enabled
)

:: PostgreSQL CHeck
IF EXIST "%TOOLS_DIR%\PostgreSQL\11\pg_env.bat" ( SET PGSQL_STATUS=Installed )

:: Qt Tool Chain
:: Note: The call command generates the Qt Installer JavaScripts (min, and full)
call "%SETUP_DIR%\qt\qtgenjs.cmd" >NUL 2>&1
IF EXIST "%TOOLS_DIR%\Qt\MaintenanceTool.exe" ( SET QTMAINT_STATUS=Installed )
IF EXIST "%TOOLS_DIR%\Qt\Tools\QtCreator\bin\qtcreator.exe" ( SET QTCREATOR_STATUS=Installed )
IF EXIST "%TOOLS_DIR%\Qt\5.12.2\mingw73_64\bin\Qt5Core.dll" ( SET QT5122_STATUS=Installed )
IF EXIST "%TOOLS_DIR%\Qt\5.12.3\mingw73_64\bin\Qt5Core.dll" ( SET QT5123_STATUS=Installed )
IF EXIST "%TOOLS_DIR%\Qt\5.12.4\mingw73_64\bin\Qt5Core.dll" ( SET QT5124_STATUS=Installed )
IF EXIST "%TOOLS_DIR%\Qt\5.13.0\mingw73_64\bin\Qt5Core.dll" ( SET QT5130_STATUS=Installed )
IF EXIST "%TOOLS_DIR%\Qt\Tools\mingw730_64\bin\gcc.exe" ( SET GCC73_STATUS=Installed )
GOTO _DOSKEYS

::------------------------------------------------------------------------------
:: DOSKEY's
::------------------------------------------------------------------------------

:_DOSKEYS
DOSKEY gitsetup = call %SETUP_DIR%\git\git-install.cmd $*
DOSKEY pysetup = call %SETUP_DIR%\miniconda\python-install.cmd $*
DOSKEY pysetup-all = call %SETUP_DIR%\miniconda\pysetup-all.cmd
DOSKEY pgsetup = call %SETUP_DIR%\postgres\postgresql-install.cmd $*
DOSKEY qtsetup = call %SETUP_DIR%\qt\qt-install.cmd $*

::------------------------------------------------------------------------------
:: PRTINT TOOL CHAN STATUS / GREETING MESSAGE
::------------------------------------------------------------------------------

:_GREETING
CLS
ECHO --------------------------------------------
ECHO  JTSDK64 Tools Setup v%version%
ECHO --------------------------------------------
ECHO.
ECHO  Core Tool Status
ECHO     Git .......... %GIT_STATUS%
ECHO     Python ....... %PYTHON_STATUS%
ECHO     JTPY Env ..... %JTPY_STATUS%
ECHO.
ECHO  Qt Tool Chain Status
ECHO     5.12.2 ....... %QT5122_STATUS%
ECHO     5.12.3 ....... %QT5123_STATUS%
ECHO     5.12.4 ....... %QT5124_STATUS%
ECHO     5.13.0 ....... %QT5130_STATUS%
ECHO     GCC 7.3 ...... %GCC73_STATUS%
ECHO     QtCreator .... %QTCREATOR_STATUS%
ECHO     Maintenance .. %QTMAINT_STATUS%

::ECHO.
:: For future releases
::ECHO  Other Tool Status
::ECHO     Postgres ..... %PGSQL_STATUS%
::ECHO     Dotnet ....... %DOTNET_STATUS%
::ECHO     Java ......... %JAVA_STATUS%
ECHO.
ECHO  Help Commands
ECHO     Git .......... gitsetup help
ECHO     Python ....... pysetup help
ECHO     Qt ........... qtetup help
ECHO.
GOTO EOF

:EOF
%WINDIR%\System32\cmd.exe /A /Q /K