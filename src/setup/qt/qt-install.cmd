::-----------------------------------------------------------------------------::
:: Name .........: qt-install.cmd
:: Project ......: Part of the JTSDK64 Tools Project
:: Description ..: Installs Qt for Windows
:: Project URL ..: https://github.com/KI7MT/jtsdk64-tools-scripts.git
:: Usage ........: call this from jtsdk64-tools-setup => qt-install $*
::
:: Author .......: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
:: Copyright ....: Copyright (C) 2013-2019 Greg Beam, KI7MT
:: License ......: GPLv3
::-----------------------------------------------------------------------------::

:: Process input commands
IF /I [%1]==[min] (
    SET script=min
    GOTO APP_INFO )
IF /I [%1]==[full] (
    SET script=full
    GOTO APP_INFO )
IF /I [%1]==[update] ( GOTO UPDATE_COMPONENTS )
IF /I [%1]==[manage] ( GOTO MANAGE_COMPONENTS )
IF /I [%1]==[help] ( GOTO _HELP )
GOTO _HELP

:: APPLICATION INFO ------------------------------------------------------------
:APP_INFO
SET ins_ver=3.1.1
GOTO GEN_QS

:: GENERATE JavaScripts --------------------------------------------------------
:GEN_QS
call "%SETUP_DIR%\qt\qtgenjs.cmd"
GOTO INSTALL_QT

:: INSTALL Qt ------------------------------------------------------------------
:INSTALL_QT
ECHO.
ECHO ------------------------------------------------------------
ECHO Installing Qt Using Generated QS Scripts
ECHO ------------------------------------------------------------
ECHO.
ECHO IMPORTANT^: Many installer buttons are disabled for several pages.
ECHO To Cancel ^/ Stop the install, use the Windows Task Manager
ECHO and kill the application installer.
ECHO.
ECHO USER ACTION: Once the Installer Starts, on the page that states
ECHO "Welcome to the QT Online Installer", click "NEXT". After
ECHO  that, NO other user action is required.
ECHO.
pause
ECHO.
ECHO Sarting Qt Installation. Cick "NEXT" on the Welcome screen,
ECHO then the installer script will do the rest.
ECHO.
CD %SETUP_DIR%\qt
qt-unified-windows-x86-online.exe --script .\qt-%script%-install.qs
IF %ERRORLEVEL% == 0 (
    ECHO Install Check Passed
    GOTO INSTALL_SUMMARY
) ELSE (
    ECHO Install failed. Post Comment on JTSDK^@Groups.io
    exit /b 1
)
GOTO INSTALL_SUMMARY

:: INSTALL SUMMARY -------------------------------------------------------------
:INSTALL_SUMMARY
ECHO.
ECHO -----------------------------------------------------
ECHO  JTSDK64 Git Install Summary
ECHO -----------------------------------------------------
ECHO.
ECHO  JTSDK64 Tools Qt Installaiton Complete. The following
ECHO  componanets were installed:
ECHO.
IF /I [%script%]==[min] (
ECHO  Install Type .... Minimal
ECHO  Install Script .. %SETUP_DIR%\qt\qt-%script%-install.qs
ECHO  Location ........ %TOOLS_DIR%\Qt
ECHO.
ECHO  Qt COmponents:
ECHO     qt.tools.qtcreator
ECHO     qt.tools.maintenance
ECHO     qt.qt5.5124.win64_mingw73
ECHO     qt.tools.win64_mingw730
ECHO     qt.tools.vcredist_msvc2017_x64
)
IF /I [%script%]==[full] (
ECHO  Install Type .... Full
ECHO  Install Script .. %SETUP_DIR%\qt\qt-%script%-install.qs
ECHO  Location ........ %TOOLS_DIR%\Qt
ECHO.
ECHO  Qt COmponents:
ECHO     qt.tools.qtcreator
ECHO     qt.tools.maintenance
ECHO     qt.qt5.5122.win64_mingw73
ECHO     qt.qt5.5123.win64_mingw73
ECHO     qt.qt5.5124.win64_mingw73
ECHO     qt.qt5.5130.win64_mingw73
ECHO     qt.tools.win64_mingw730
ECHO     qt.tools.vcredist_msvc2017_x64
)
ECHO.
ECHO  To ensure the install worked properly,
ECHO  exit the setup environment, then re^-launch
ECHO  jtsdk64^-tools^setup checking the status of each
ECHO  component.
GOTO EOF

:: ADD_PACKAGES ----------------------------------------------------------------
:UPDATE_COMPONENTS
CLS
ECHO -------------------------------------------------------
ECHO  JTSDK64 Qt Maintainence Tool Update Components
ECHO -------------------------------------------------------
ECHO.
ECHO Starting Qt Maintainence Tool to Update Components
ECHO.
start %TOOLS_DIR%\Qt\MaintenanceTool.exe ^-^-updater
GOTO EOF

:: MANAGE_PACKAGES ----------------------------------------------------------------
:MANAGE_COMPONENTS
CLS
ECHO -------------------------------------------------------
ECHO  JTSDK64 Qt Maintainence Tool Manage Components
ECHO -------------------------------------------------------
ECHO.
ECHO Starting Qt Maintainence Tool to Add or Remove Component.
ECHO.
start %TOOLS_DIR%\Qt\MaintenanceTool.exe ^-^-manage-packages
GOTO EOF

:: INSTALL_HELP ----------------------------------------------------------------
:_HELP
CLS
ECHO -------------------------------------------------------
ECHO  JTSDK64 Qt Installation Help
ECHO -------------------------------------------------------
ECHO.
ECHO  This script installs Qt using one of two configurations:
ECHO.
ECHO    1. Minimial Script ^(qt^-min^-install^.qs)
ECHO       Installs the following components:
ECHO         qt.tools.qtcreator
ECHO         qt.tools.maintenance
ECHO         qt.qt5.5124.win64_mingw73
ECHO         qt.tools.win64_mingw730
ECHO         qt.tools.vcredist_msvc2017_x64
ECHO.
ECHO    2. Full Script ^(qt^-full^-install^.qs)
ECHO       Installs minimal^, plus additional versions
ECHO         qt.qt5.5122.win64_mingw73
ECHO         qt.qt5.5123.win64_mingw73
ECHO         qt.qt5.5130.win64_mingw73
ECHO.
ECHO  Usage:
ECHO    qtsetup help .... Display this help message
ECHO    qtsetup min ..... Insall minimal components
ECHO    qtsetup full .... Install all supported components
ECHO    qtsetup update .. Update Components in Installation
ECHO    qtsetup manage .. Manage Installed Components
ECHO.
ECHO  Uninstall:
ECHO    To uninstall Qt, launch the Maintenance Tool and select
ECHO    uninstall when asked.
ECHO.
ECHO    Location : %TOOLS_DIR%\Qt\MaintenanceTool.exe
ECHO.
GOTO EOF

:EOF
CD %JTSDK64_HOME%
exit /b 0
