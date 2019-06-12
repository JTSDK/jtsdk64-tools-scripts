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
@MODE CON: COLS=85 LINES=45

:: RESET TOOL STATUS
SET POSTGRES=Not Installed
SET PYTOOLS=Not Installed
SET UNIXTOOLS=Disabled

:: JTSDK Version
SET version=%JTSDK_VERSION%

:: Set the header informaiton
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

ECHO ^* Checking PostgreSQL
:POSTGRES_CHECK
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
IF ["%QTV%"]==["5.12.2"] (GOTO QT_5122)
IF ["%QTV%"]==["5.12.3"] (GOTO QT_5123)
GOTO UNSUPPOERTED_QT_VERSION

:QT_5122
SET PROMPT=$CQT-5.12.2$F $P ^>
SET title-string=JTSDK64-Tools using QT 5.12.2
SET QTD=%JTSDK_HOME%\tools\Qt\5.12.2\mingw73_64\bin
SET QTP=%JTSDK_HOME%\tools\Qt\5.12.2\mingw73_64\plugins\platforms
SET GCCD=%JTSDK_HOME%\tools\Qt\Tools\mingw730_64\bin
GOTO QTPATHS

:QT_5123
SET PROMPT=$CQT-5.12.3$F $P ^>
SET title-string=JTSDK64-Tools using QT 5.12.3
SET QTD=%JTSDK_HOME%\tools\Qt\5.12.3\mingw73_64\bin
SET QTP=%JTSDK_HOME%\tools\Qt\5.12.3\mingw73_64\plugins\platforms
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
IF EXIST "%JTSDK_HOME%\tools\jtsdkpy\Scripts\activate.bat" (GOTO PY_TOOLS)
GOTO SET_FINAL

:PY_TOOLS
ECHO ^* Setting Python Tool Paths
SET PYTOOLS=Installed
call %JTSDK_HOME%\tools\jtsdkpy\Scripts\activate.bat

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
DOSKEY version-check = call python %JTSDK_HOME%\tools\scripts\python\version-check.py
DOSKEY env-check = call python %JTSDK_HOME%\tools\scripts\python\env-check.py
DOSKEY jtsdk-help = call python %JTSDK_HOME%\tools\scripts\python\help.py
DOSKEY home = CD %JTSDK_HOME% $T call python %JTSDK_HOME%\tools\scripts\python\env-message.py
DOSKEY gentc = call python %JTSDK_HOME%\tools\scripts\python\gentc.py
DOSKEY srcd = CD %JTSDK_HOME%/src
DOSKEY clear=cls
DOSKEY ls = ls --color=tty $*
DOSKEY lsb=dir /b

::------------------------------------------------------------------------------
:: PRINT ENVIRONMENT MESSAGE
::------------------------------------------------------------------------------
:: timeout /t 2 :: Use this for screen print testing
call python %JTSDK_HOME%\tools\scripts\python\gentc.py
call python %JTSDK_HOME%\tools\scripts\python\env-message.py
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
ECHO.
ECHO  If you think this message is in error,
ECHO  post a message at: https^:^/^/groups.io^/g^/JTSDK
ECHO.

:RUN
%WINDIR%\System32\cmd.exe /A /Q /K