::-----------------------------------------------------------------------------::
:: Name .........: pysetup-all-stub.cmd
:: Project ......: Part of the JTSDK64 Tools Project
:: Description ..: Installs all Python requirements for JTSDK64
:: Project URL ..: https://github.com/KI7MT/jtsdk64-tools-scripts.git
:: Usage ........: Call this from jtsdk64-tools-setup => pysetup-all
::
:: Author .......: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
:: Copyright ....: Copyright (C) 2013-2019 Greg Beam, KI7MT
:: License ......: GPLv3
::-----------------------------------------------------------------------------::

:: Run all python install functions
set step=Python Install
call %SETUP_DIR%\miniconda\python-install.cmd install
if %ERRORLEVEL% EQU 0 goto conda_setup
goto error_message

:conda_setup
set step=Conda Update
call %SETUP_DIR%\miniconda\python-install.cmd update-conda
if %ERRORLEVEL% EQU 0 goto upgrade_pip
goto error_message

:upgrade_pip
set step=Upgrade PIP
call %SETUP_DIR%\miniconda\python-install.cmd upgrade-pip
if %ERRORLEVEL% EQU 0 goto create_env
goto error_message

:create_env
set step=Create Env
call %SETUP_DIR%\miniconda\python-install.cmd create-env
if %ERRORLEVEL% EQU 0 goto activation
goto error_message

:activation
set step=JTPY Activation
call %SETUP_DIR%\miniconda\python-install.cmd activate
if %ERRORLEVEL% EQU 0 goto install_deps
goto error_message

:install_deps
set step=Install Deps
call %SETUP_DIR%\miniconda\python-install.cmd install-deps
if %ERRORLEVEL% EQU 0 goto EOF
goto error_message

:EOF
exit /b 0

:error_message
echo Processing Error
echo.
echo The exit status from step [ %step% ] returned
echo a non-zero status. Check the error message and
echo and try again.
echo.
echo  If the problem presists^, contact^: JTSDK@Groups.io
echo.
exit /b1

