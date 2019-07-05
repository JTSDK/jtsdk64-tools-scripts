::-----------------------------------------------------------------------------::
:: Name .........: git-install.cmd
:: Project ......: Part of the JTSDK64 Tools Project
:: Description ..: Installs Git SCM for Windows
:: Project URL ..: https://github.com/KI7MT/jtsdk64-tools-scripts.git
:: Usage ........: Call this from jtsdk64-tools-setup => git-install $*
::
:: Author .......: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
:: Copyright ....: Copyright (C) 2013-2019 Greg Beam, KI7MT
:: License ......: GPLv3
::-----------------------------------------------------------------------------::

:: Process input commands
IF /I [%1]==[install] ( GOTO INSTALL_GIT )
IF /I [%1]==[update] ( GOTO UPDATE_GIT )
IF /I [%1]==[uninstall] ( GOTO UNINSTALL )
IF /I [%1]==[help] ( GOTO _HELP )
GOTO _HELP

:: INSTALL GIT -----------------------------------------------------------------
:INSTALL_GIT
CLS
ECHO ------------------------------
ECHO Installing Git
ECHO ------------------------------
ECHO.
CD %SETUP_DIR%\git
ECHO Running Git-2.22.0-64-bit^.exe^, Please Wait
Git-2.22.0-64-bit.exe ^/SILENT ^/CLOSEAPPLICATIONS ^/LOADINF=.^\git.inf

ECHO Verifying Installation
git --version >NUL 2>&1
IF %ERRORLEVEL% == 0 (
    SET GIT_STATUS=Installed
    ECHO Install Check Passed
    GOTO INSTALL_SUMMARY
) ELSE (
    ECHO Install failed. Post Comment on JTSDK^@Groups.io
    exit /b 1
)

:: UPDATE GIT ------------------------------------------------------------------
:UPDATE_GIT
CLS
ECHO ------------------------------
ECHO Updating Git Installation
ECHO ------------------------------
ECHO.
ECHO Upgrading Git Tools
git update-git-for-windows
IF ERRORLEVEL 0 (
    ECHO Done
    GOTO EOF
) ELSE (
    ECHO Updating Git Failed! Contact JTSDK^@Groups.io
    exit /b 1
)

:: UNINSTALL -------------------------------------------------------------------
:UNINSTALL
CLS
ECHO -----------------------------------------------------
ECHO  JTSDK64 Git Uninstall
ECHO -----------------------------------------------------
ECHO.
ECHO Running Uninstall got Git
IF EXIST "%PROGRAMFILES%\Git\unins000.exe" (
    call "%PROGRAMFILES%\Git\unins000.exe"
) ELSE (
    ECHO.
    ECHO Uninstall failed, cannot find uninstall binary.
    exit /b 1
)

GOTO EOF

:: INSTALL SUMMARY -------------------------------------------------------------
:INSTALL_SUMMARY
ECHO.
ECHO -----------------------------------------------------
ECHO  JTSDK64 Git Install Summary
ECHO -----------------------------------------------------
ECHO.
ECHO  JTSDK64 Tools Git Installaiton ^| Upgrade Complete.
ECHO  The following is a summery of the installation.
ECHO.
ECHO  Install Directory ..... %ProgramFiles%\Git
ECHO.
ECHO  To ensure the install ^| upgrade worked properly,
ECHO  ^exit the setup environment and re^-launch
ECHO  jtsdk64-tools-setup.
ECHO.
ECHO  Test the git binary with ^: git ^-^-version
ECHO.
GOTO EOF

:: INSTALL_HELP ----------------------------------------------------------------
:_HELP
CLS
ECHO.
ECHO -------------------------------------------------------
ECHO  JTSDK64 Git Setup Help
ECHO -------------------------------------------------------
ECHO.
ECHO  Use the following commands to install and configure
ECHO  Git SCM for Windows.
ECHO.
ECHO  gitsetup help          Shows this help screen
ECHO  gitsetup install       Install Git
ECHO  gitsetup update        Update Git to latest version
ECHO.
ECHO  Uninstall
ECHO    gitsetup uninstall    Uninstall Git
ECHO.
ECHO  To ensure the install ^| upgrade worked properly,
ECHO  ^exit the setup environment, then re^-launch
ECHO  jtsdk64-tools-setup, then test the install.
ECHO.
ECHO  Test the git binary with ^: git ^-^-version
ECHO.
GOTO EOF

:EOF
CD %JTSDK64_HOME%
exit /b 0
