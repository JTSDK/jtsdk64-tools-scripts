::-----------------------------------------------------------------------------::
:: Name .........: postgres-install.cmd
:: Project ......: Part of the JTSDK64 Tools Project
:: Description ..: Installs PostgreSQL with pgAdmin4 and command line tools
:: Project URL ..: https://github.com/KI7MT/jtsdk64-tools-scripts.git
:: Usage ........: call this from jtsdk64-tools-setup => pgsetup install
::
:: Author .......: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
:: Copyright ....: Copyright (C) 2013-2019 Greg Beam, KI7MT
:: License ......: GPLv3
::-----------------------------------------------------------------------------::

:: Process input commands
IF /I [%1]==[install] ( GOTO INSTALL_POSTGRESQL )
IF /I [%1]==[uninstall] ( GOTO UNINSTALL )
IF /I [%1]==[help] ( GOTO INSTALL_HELP )
GOTO INSTALL_HELP

:: Variables
SET pgversion=11.3.4

:: INSTALL MINICONDA -----------------------------------------------------------
:INSTALL_POSTGRESQL
CLS
ECHO --------------------------------
ECHO Installing PostgreSQL %pgversion%
ECHO --------------------------------
ECHO.
CD %SETUP_DIR%\postgres
ECHO Running postgresql-11.3-4-windows-x64.exe^. Please Wait
postgresql-11.3-4-windows-x64.exe^
 ^-^-mode unattended^
 ^-^-unattendedmodeui minimal^
 ^-^-superaccount postgres^
 ^-^-superpassword postgress^
 ^-^-disable-components stackbuilder^
 ^-^-enable-components server,pgAdmin,commandlinetools^
 ^-^-create_shortcuts 1^
 ^-^-prefix %PGSQL_INSTALL_DIR%^
 ^-^-datadir %PGSQL_DATA_DIR%

ECHO Verifying Installation
IF EXIST %PGSQL_INSTALL_DIR%\bin\psql.exe (
    ECHO Install Check Passed.
    GOTO INSTALL_SUMMARY
) ELSE (
    ECHO Install failed. Post Comment on JTSDK^@Groups.io
    exit /b 1
)

:: INSTALL SUMMARY -------------------------------------------------------------
:INSTALL_SUMMARY
ECHO.
ECHO -----------------------------------------------------
ECHO  PostgreSQL %pgversion% Install Summary
ECHO -----------------------------------------------------
ECHO.
ECHO  JTSDK64 Tools PostgreSQL Installaiton is Complete.
ECHO  The following is a summary of the installation.
ECHO.
ECHO  Install Directory ... %PGSQL_INSTALL_DIR%
ECHO  Data Directory ...... %PGSQL_DATA_DIR%
ECHO  Environment Script .. %PGSQL_INSTALL_DIR%\pg_env.bat
ECHO.
ECHO  To ensure the install worked properly, exit the setup
ECHO  environment, then re^-launch jtsdk64-tools-setup.
ECHO.
GOTO EOF

:: UNINSTALL -------------------------------------------------------------------
:UNINSTALL
cls
ECHO -----------------------------------------------------
ECHO  JTSDK64 PostgreSQL Uninstall
ECHO -----------------------------------------------------
ECHO.
CD %PGSQL_INSTALL_DIR%
ECHO Running uninstall-postgresql^.exe
uninstall-postgresql^.exe
GOTO EOF

:: INSTALL_HELP ----------------------------------------------------------------
:INSTALL_HELP
CLS
ECHO.
ECHO -------------------------------------------------------
ECHO  JTSDK64 PostgreSQL %pgversion% Setup Help
ECHO -------------------------------------------------------
ECHO.
ECHO  Use the following commands to install and configure
ECHO  PostgreSQL.
ECHO.
ECHO  pgsetup help             Shows this help screen
ECHO  pgsetup install          Install PostgreSQL
ECHO.
ECHO  Uninstall
ECHO    pgsetup uninstall    Uninstall PostgreSQL
ECHO.
ECHO  To ensure the install worked properly, exit the setup
ECHO  environment and re^-launch jtsdk64-tools-setup.
ECHO.
GOTO EOF


:EOF
CD %JTSDK64_HOME%
exit /b 0