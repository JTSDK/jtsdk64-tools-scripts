::-----------------------------------------------------------------------------::
:: Name .........: jtsdk64-tools-setup.cmd
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
SET JTSDK64_VERSION=3.1.0 Alpha
@chcp 1252 >NUL 2>&1
@SET LANG=en_US
SET version=%JTSDK64_VERSION%
TITLE JTSDK64 Tools Application Setup %version%

::------------------------------------------------------------------------------
:: GLOBAL ENVIRONMENT VARIABLES and PATHS
::------------------------------------------------------------------------------

SET JTSDK64_HOME=%CD%
SET TOOLS_DIR=%JTSDK64_HOME%\tools
SET SETUP_DIR=%JTSDK64_HOME%\tools
SET PATH=%JTSDK64_HOME%;%TOOLS_DIR%;%SETUP_DIR%;%PATH%
DOSKEY jt64setup = call %JTSDK_HOME%\tools\setup\jt64setup.exe $*

::------------------------------------------------------------------------------
:: TOOL INSTALL VALIDATION
::------------------------------------------------------------------------------

:: Set Initial tool status
SET GIT_STATUS=Not Installed
SET PYTHON_STATUS=Not Installed
SET PGSQL_STATUS=Not Installed
SET QTMAINT_STATUS=Not Installed
SET QTCREATOR_STATUS=Not Installed
SET GCC73_STATUS=Not Installed
SET QT5122_STATUS=Not Installed
SET QT5123_STATUS=Not Installed
SET QT5124_STATUS=Not Installed
SET DOTNET_STATUS=Not Installed
SET JAVA_STATUS=Not Installed
GOTO APP_CHECK

:APP_CHECK
git --version >NUL 2>&1
IF %ERRORLEVEL% == 0 ( SET GIT_STATUS=Installed )

dotnet --version >NUL 2>&1
IF %ERRORLEVEL% == 0 ( SET DOTNET_STATUS=Installed )

java -version >NUL 2>&1
IF %ERRORLEVEL% == 0 ( SET JAVA_STATUS=Installed )

IF EXIST "%TOOLS_DIR%\python\python.exe" ( SET PYTHON_STATUS=Installed)
IF EXIST "%TOOLS_DIR%\PostgreSQL\11\pg_env.bat" ( SET PGSQL_STATUS=Installed )

:: Qt Tool Chain
IF EXIST "%TOOLS_DIR%\Qt\MaintenanceTool.exe" ( SET QTMAINT_STATUS=Installed )
IF EXIST "%TOOLS_DIR%\Qt\Tools\QtCreator\bin\qtcreator.exe" ( SET QTCREATOR_STATUS=Installed )
IF EXIST "%TOOLS_DIR%\Qt\5.12.2\mingw73_64\bin\Qt5Core.dll" ( SET QT5122_STATUS=Installed )
IF EXIST "%TOOLS_DIR%\Qt\5.12.3\mingw73_64\bin\Qt5Core.dll" ( SET QT5123_STATUS=Installed )
IF EXIST "%TOOLS_DIR%\Qt\5.12.4\mingw73_64\bin\Qt5Core.dll" ( SET QT5124_STATUS=Installed )
IF EXIST "%TOOLS_DIR%\Qt\Tools\mingw730_64\bin\gcc.exe" ( SET GCC73_STATUS=Installed )
GOTO _GREETING

::------------------------------------------------------------------------------
:: PRTINT TOOL CHAN STATUS / GREETING MESSAGE
::------------------------------------------------------------------------------

:_GREETING
CLS
ECHO --------------------------------------------
ECHO  JTSDK64 Tools Setup Environment
ECHO --------------------------------------------
ECHO.
ECHO  Qt Tool Chain Status
ECHO     Maintenance .. %QTMAINT_STATUS%
ECHO     QtCreator .... %QTCREATOR_STATUS%
ECHO     GCC 7.3 ...... %GCC73_STATUS%
ECHO     5.12.2 ....... %QT5122_STATUS%
ECHO     5.12.3 ....... %QT5123_STATUS%
ECHO     5.12.4 ....... %QT5124_STATUS%
ECHO.
ECHO  General Use Tool Status
ECHO     Git .......... %GIT_STATUS%
ECHO     Python ....... %PYTHON_STATUS%
ECHO     Postgres ..... %PGSQL_STATUS%
ECHO     Dotnet ....... %DOTNET_STATUS%
ECHO     Java ......... %JAVA_STATUS%
ECHO.
ECHO   To manage JTSDK64-Tools Applications,
ECHO   run the following command^:
ECHO.
ECHO   Type ^: jt64setup
ECHO.
ECHO.
GOTO EOF

:EOF
%WINDIR%\System32\cmd.exe /A /Q /K