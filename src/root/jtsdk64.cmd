::-----------------------------------------------------------------------------::
:: Name .........: jtsdk64.cmd
:: Project ......: Part of the JTSDK64 Tools Project
:: Version ......: 3.1.0
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

IF /I [%1]==[-d] (
    SET debug=1
    GOTO APP_INFO
)

:APP_INFO
SET JTSDK_VERSION=3.1.0
@chcp 65001 >NUL 2>&1
@SET LANG=en_US

:: RESET TOOL STATUS
SET POSTGRES=Not Installed
SET PYTOOLS=Not Installed
SET UNIXTOOLS=Disabled

:: JTSDK Version
SET version=%JTSDK_VERSION%

:: Set Initial Header informaiton
TITLE JTSDK64 Tools %version%

::------------------------------------------------------------------------------
:: GLOBAL ENVIRONMENT VARIABLES and PATHS
::------------------------------------------------------------------------------

ECHO ^* Setting Environment Variables
SET JTSDK_HOME=%CD%
SET JTSDK_CONFIG=%JTSDK_HOME%\config
SET JTSDK_DATA=%JTSDK_HOME%\data
SET JTSDK_SRC=%JTSDK_HOME%\src
SET JTSDK_TMP=%JTSDK_HOME%\tmp
SET JTSDK_SCRIPTS=%JTSDK_HOME%\tools\scripts\python

:: Create Folders
ECHO ^* Creating Directories
mkdir %JTSDK_CONFIG% >NUL 2>&1
mkdir %JTSDK_DATA% >NUL 2>&1
mkdir %JTSDK_SRC% >NUL 2>&1
mkdir %JTSDK_TMP% >NUL 2>&1
mkdir %JTSDK_SCRIPTS% >NUL 2>&1
GOTO POSTGRES_CHECK

::------------------------------------------------------------------------------
:: PostgreSQL PATH
::------------------------------------------------------------------------------

:POSTGRES_CHECK
ECHO ^* Checking PostgreSQL
IF EXIST "%JTSDK_HOME%\tools\PostgreSQL\11\pg_env.bat" (
    call %JTSDK_HOME%\tools\PostgreSQL\11\pg_env.bat
    SET POSTGRES=Installed
)
GOTO CORE_TOOLS

::------------------------------------------------------------------------------
:: CORE TOOLS
::------------------------------------------------------------------------------

:CORE_TOOLS
ECHO ^* Setting Core Tool Variables
IF EXIST "%JTSDK_HOME%\tools" (SET CORETOOLS=Installed)
SET fftwv=3.3.5
SET libusbv=1.0.22
SET nsisv=3.04
SET pkgconfigv=0.28.1
SET rubyv=2.6.3
SET svnv=1.9.7
SET cmakev=3.14.4
SET sqlitev=3.28
SET mongodbv=4.0.10


:: MongoDB
SET mongodb_dir=%JTSDK_HOME%\tools\mongodb\%mongodbv%\bin
SET "mongodb_dir_f=%mongodb_dir:\=/%"
SET JTSDK_PATH=%JTSDK_PATH%;%mongodb_dir%

:: SQlite
SET sqlite_dir=%JTSDK_HOME%\tools\sqlite\%sqlitev%
SET "sqlite_dir_f=%sqlite_dir:\=/%"
SET JTSDK_PATH=%JTSDK_PATH%;%sqlite_dir%

:: FFTW
SET fftw3f_dir=%JTSDK_HOME%\tools\fftw\%fftwv%
SET "fftw3f_dir_f=%fftw3f_dir:\=/%"
SET JTSDK_PATH=%JTSDK_PATH%;%fftw3f_dir%

:: LIBUSB
SET libusb_dir=%JTSDK_HOME%\tools\libusb\%libusbv%
SET "libusb_dir_f=%libusb_dir:\=/%"
SET JTSDK_PATH=%JTSDK_PATH%;%linusb_dir%

:: NSIS
SET nsis_dir=%JTSDK_HOME%\tools\nsis\%nsisv%
SET "nsis_dir_f=%nsis_dir:\=/%"
SET JTSDK_PATH=%JTSDK_PATH%;%nsis_dir%

:: PKG_CONFIG
SET pkgconfig_dir=%JTSDK_HOME%\tools\pkgconfig\%pkgconfigv%\bin
SET "pkgconfig_dir_f=%pkgconfig_dir:\=/%"
SET JTSDK_PATH=%JTSDK_PATH%;%pkgconfig_dir%

:: RUBY
SET ruby_dir=%JTSDK_HOME%\tools\ruby\%rubyv%\bin
SET "ruby_dir_f=%ruby_dir:\=/%"
SET JTSDK_PATH=%JTSDK_PATH%;%ruby_dir%

:: SVN
SET svn_dir=%JTSDK_HOME%\tools\subversion\%svnv%\bin
SET "svn_dir_f=%svn_dir:\=/%"
SET JTSDK_PATH=%JTSDK_PATH%;%svn_dir%

:: CMake
SET cmake_dir=%JTSDK_HOME%\tools\cmake\%cmakev%\Bin
SET "cmake_dir_f=%cmake_dir:\=/%"
SET JTSDK_PATH=%JTSDK_PATH%;%cmake_dir%

:: Scripts Directory
SET scripts_dir=%JTSDK_HOME%\tools\scripts\cmd
SET JTSDK_PATH=%JTSDK_PATH%;%scripts_dir%


::------------------------------------------------------------------------------
:: CONDITIONAL PATHS for Multiple versions of Qt
::------------------------------------------------------------------------------

:: QT SELECTION
SET /P QTV=<%CD%\config\qt.ver
ECHO * Checking if %QTV% is supported
IF ["%QTV%"]==["5.12.2"] ( GOTO QT_ENV_SET )
IF ["%QTV%"]==["5.12.3"] ( GOTO QT_ENV_SET )
IF ["%QTV%"]==["5.12.4"] ( GOTO QT_ENV_SET )
IF ["%QTV%"]==["5.13.0"] ( GOTO QT_ENV_SET )
GOTO UNSUPPOERTED_QT_VERSION

:QT_ENV_SET
SET PROMPT=$CQT-%QTV%$F $P ^>
IF /I [%debug%]==[1] (
    SET title-string=JTSDK64-Tools using QT %QTV% - Debug
) ELSE (
    SET title-string=JTSDK64-Tools using QT %QTV% - Debug
)
SET QTD=%JTSDK_HOME%\tools\Qt\%QTV%\mingw73_64\bin
SET QTP=%JTSDK_HOME%\tools\Qt\%QTV%\mingw73_64\plugins\platforms
SET GCCD=%JTSDK_HOME%\tools\Qt\Tools\mingw730_64\bin
GOTO QTPATHS

:QTPATHS
SET JTSDK_PATH=%GCCD%;%QTD%;%QTP%;%JTSDK_PATH%

:: Set forward slash paths for MSYS2 and QT
SET "QTD_F=%QTD:\=/%"
SET "GCCD_F=%GCCD:\=/%"

:: END CORE TOOLS -------------------------------------------------------------
GOTO PY_CHECK

::------------------------------------------------------------------------------
:: PYTHON TOOLS
::------------------------------------------------------------------------------

:PY_CHECK
IF EXIST "%JTSDK_HOME%\tools\python\Scripts\activate.bat" (GOTO PY_TOOLS)
GOTO SET_FINAL

:PY_TOOLS
ECHO ^* Setting Python Tool Paths
SET PYTOOLS=Installed
call %JTSDK_HOME%\tools\python\Scripts\activate.bat D:\JTSDK64-Tools\tools\python
call conda activate jtpy

:: Add the python scripts directory to PATH
SET JTSDK_PATH=%JTSDK_PATH%;%JTSDK_SCRIPTS%
GOTO SET_FINAL

::------------------------------------------------------------------------------
:: SET FINAL ENVIRONMENT PATHS and CONSOLE TITLE
::------------------------------------------------------------------------------

:SET_FINAL
ECHO ^* Set Final Paths and headers
TITLE %title-string%
SET PATH=%JTSDK_PATH%;%PATH%

:: UNIX TOOLS
IF EXIST "%JTSDK_CONFIG%\unix" (
SET UNIXTOOLS=Enabled
GOTO SET_UNIX
)
GOTO SET_DOSKEYS

:SET_UNIX
SET unix_dir=%JTSDK_HOME%\tools\msys64\usr\bin
SET PATH=%PATH%;%unix_dir%
GOTO SET_DOSKEYS

:SET_DOSKEYS
::------------------------------------------------------------------------------
:: GENERATE DOSKEY's
::------------------------------------------------------------------------------
ECHO ^* Generating Doskey^'s
DOSKEY msys2 = %JTSDK_HOME%\tools\msys64\msys2_shell.cmd
DOSKEY jtversion = call python jt64version $*
DOSKEY jtenv = call python jt64env $*
DOSKEY jt64help = python -c "from jt64common.help import jt64_main_help; jt64_main_help()"
DOSKEY home = CD %JTSDK_HOME% $T call python -c "from jt64common.messages import main_header_message; main_header_message()"
DOSKEY jtgentc = call jt64gentc $*
DOSKEY srcd = CD %JTSDK_HOME%/src
DOSKEY clear=cls
DOSKEY ls = ls --color=tty $*
DOSKEY lsb=dir /b

::------------------------------------------------------------------------------
:: Generate Qt Tool Chain Files
::------------------------------------------------------------------------------
ECHO * Generating Qt Tool CHain Files
call python -c "import jt64gentc; jt64gentc"

::------------------------------------------------------------------------------
:: PRINT ENVIRONMENT MESSAGE
::------------------------------------------------------------------------------
IF /I [%debug%]==[1] (timeout /t 60)
call python -c "from jt64common.messages import main_header_message; main_header_message()"
ECHO.
GOTO RUN

:UNSUPPOERTED_QT_VERSION
ECHO.
ECHO --------------------------------------------
ECHO  Unsupported QT Version ^[%QTV%^]
ECHO --------------------------------------------
ECHO.
ECHO  The QT Version ^(%QTV%) ^set in the qt.ver
ECHO  file is unsupported. The following versions
ECHO  are available at this time:
ECHO.
ECHO  QT 5.12.2 x64 with GCC 730_64
ECHO  QT 5.12.3 x64 with GCC 730_64
ECHO  QT 5.12.4 x64 with GCC 730_64
ECHO  QT 5.13.0 x64 with GCC 730_64
ECHO.
ECHO  If you think this message is in error,
ECHO  post a message at: https^:^/^/groups.io^/g^/JTSDK
ECHO.

:RUN
%WINDIR%\System32\cmd.exe /A /Q /K