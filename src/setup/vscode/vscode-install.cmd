::-----------------------------------------------------------------------------::
:: Name .........: vscode-install.cmd
:: Project ......: Part of the JTSDK64 Tools Project
:: Description ..: Installs VS Code for Windows
:: Project URL ..: https://github.com/KI7MT/jtsdk64-tools-scripts.git
:: Usage ........: Call this from jtsdk64-tools-setup => vscode-install $*
::
:: Author .......: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
:: Copyright ....: Copyright (C) 2013-2019 Greg Beam, KI7MT
:: License ......: GPLv3
::-----------------------------------------------------------------------------::

:: Process input commands
IF /I [%1]==[install] ( GOTO INSTALL_CODE )
IF /I [%1]==[uninstall] ( GOTO UNINSTALL )
IF /I [%1]==[help] ( GOTO _HELP )
GOTO _HELP

:: INSTALL VS Code -------------------------------------------------------------
:INSTALL_CODE
CLS
ECHO ------------------------------
ECHO Installing VS Code
ECHO ------------------------------
ECHO.
CD %SETUP_DIR%\vscode
ECHO Running VSCodeUserSetup-x64^.exe^, Please Wait
VSCodeUserSetup-x64.exe ^/SP- ^/NOCANCEL ^/SILENT ^
^/CLOSEAPPLICATIONS ^/RESTARTAPPLICATIONS ^/LOADINF=.^\vscode.inf

ECHO Verifying Installation
IF EXIST "%LOCALAPPDATA%\Programs\Microsoft VS Code\Code.exe" (
    SET VS_CODE_STATUS=Installed
    ECHO Install Check Passed
    GOTO INSTALL_SUMMARY
) ELSE (
    ECHO Install failed. Post Comment on JTSDK^@Groups.io
    exit /b 1
)

:: UNINSTALL -------------------------------------------------------------------
:UNINSTALL
CLS
ECHO -----------------------------------------------------
ECHO  JTSDK64 VS Code Uninstall
ECHO -----------------------------------------------------
ECHO.
ECHO Running Uninstall for VS Code
IF EXIST "%LOCALAPPDATA%\Programs\Microsoft VS Code\unins000.exe" (
    call "%LOCALAPPDATA%\Programs\Microsoft VS Code\unins000.exe"
) ELSE (
    ECHO.
    ECHO Uninstall failed, cannot find Code^.exe binary.
    exit /b 1
)
GOTO EOF

:: INSTALL SUMMARY -------------------------------------------------------------
:INSTALL_SUMMARY
ECHO.
ECHO -----------------------------------------------------
ECHO  JTSDK64 VS Code Install Summary
ECHO -----------------------------------------------------
ECHO.
ECHO  JTSDK64 Tools Git Installaiton Complete.
ECHO  The following is a summary of the installation.
ECHO.
ECHO  Install Directory ^:
ECHO    "%LOCALAPPDATA%\Programs\Microsoft VS Code"
ECHO.
ECHO  To ensure the install worked properly,
ECHO  ^exit the setup environment and re^-launch
ECHO  jtsdk64-tools-setup.
ECHO.
ECHO  Test VS Code install with ^: code ^-^-version
ECHO.
GOTO EOF

:: INSTALL_HELP ----------------------------------------------------------------
:_HELP
CLS
ECHO.
ECHO -------------------------------------------------------
ECHO  JTSDK64 VS Code Setup Help
ECHO -------------------------------------------------------
ECHO.
ECHO  Use the following commands to install and configure
ECHO  Microsoft VS Code.
ECHO.
ECHO  codesetup help          Shows this help screen
ECHO  codesetup install       Install VS Code
ECHO.
ECHO  Uninstall
ECHO    codesetup uninstall   Uninstall VS Code
ECHO.
ECHO  To ensure the install worked properly,
ECHO  ^exit the setup environment and re^-launch
ECHO  jtsdk64-tools-setup.
ECHO.
ECHO  Test VS Code install with ^: code ^-^-version
ECHO.
GOTO EOF

:EOF
CD %JTSDK64_HOME%
exit /b 0
