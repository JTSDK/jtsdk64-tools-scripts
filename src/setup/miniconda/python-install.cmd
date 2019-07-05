::-----------------------------------------------------------------------------::
:: Name .........: python-install.cmd
:: Project ......: Part of the JTSDK64 Tools Project
:: Description ..: Installs Miniconda Python and JTPY Environment
:: Project URL ..: https://github.com/KI7MT/jtsdk64-tools-scripts.git
:: Usage ........: call this from jtsdk64-tools-setup => pysetup-all
::
:: Author .......: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
:: Copyright ....: Copyright (C) 2013-2019 Greg Beam, KI7MT
:: License ......: GPLv3
::-----------------------------------------------------------------------------::

:: Process input commands
IF /I [%1]==[install] ( GOTO INSTALL_MINICONDA )
IF /I [%1]==[update-conda] ( GOTO UPDATE_CONDA )
IF /I [%1]==[upgrade-pip] ( GOTO UPGRADE_PIP )
IF /I [%1]==[create-env] ( GOTO CREATE_JTPY )
IF /I [%1]==[activate] ( GOTO ACTIVATE )
IF /I [%1]==[install-deps] ( GOTO INSTALL_DEPS )
IF /I [%1]==[uninstall] ( GOTO UNINSTALL )
IF /I [%1]==[update-installer] ( GOTO UPDATE_INSTALLER )
IF /I [%1]==[help] ( GOTO INSTALL_HELP )
GOTO INSTALL_HELP

:: INSTALL MINICONDA -----------------------------------------------------------
:INSTALL_MINICONDA
CLS
ECHO ------------------------------
ECHO Installing Miniconda Python
ECHO ------------------------------
ECHO.
CD %SETUP_DIR%\miniconda
ECHO Running Miniconda3-latest-Windows-x86_64.exe^, Please Wait
Miniconda3-latest-Windows-x86_64.exe ^/InstallationType^=JustMe ^/AddToPath^=0 ^/RegisterPython^=1 ^/S ^/D^=%PYTHON_INSTALL_DIR%
ECHO Verifying Installation
IF EXIST %PYTHON_INSTALL_DIR%\python.exe (
    ECHO Install Check Passed.
    GOTO ACTIVATE_CONDA
) ELSE (
    ECHO Install failed. Post Comment on JTSDK^@Groups.io
    exit /b 1
)

:: ACTIVATE CONDA --------------------------------------------------------------
:ACTIVATE_CONDA
ECHO.
ECHO ------------------------------
ECHO Activating Miniconda Python
ECHO ------------------------------
ECHO.
ECHO Activating Miniconda
IF EXIST "%TOOLS_DIR%\python\Scripts\activate.bat" (
    call %TOOLS_DIR%\python\Scripts\activate.bat D:\JTSDK64-Tools\tools\python
    ECHO Done
    GOTO EOF
) ELSE (
    ECHO Miniconda Activation Failed! Contact JTSDK^@Groups.io
    exit /b 1
)

:: UPDATE CONDA ----------------------------------------------------------------
:UPDATE_CONDA
ECHO.
ECHO ------------------------------
ECHO Updating Conda Tools
ECHO ------------------------------
ECHO.
ECHO Upgrading Conda Tools
conda update ^-y conda
IF ERRORLEVEL 0 (
    ECHO Done
    GOTO EOF
) ELSE (
    ECHO Udating Conda Scripts Failed! Contact JTSDK^@Groups.io
    exit /b 1
)

:: UPGRADE PIP -----------------------------------------------------------------
:UPGRADE_PIP
ECHO.
ECHO ------------------------------
ECHO Upgrading Pip
ECHO ------------------------------
ECHO.
ECHO Upgrading PIP
conda upgrade -y pip
IF ERRORLEVEL 0 (
    ECHO Done
    GOTO EOF
) ELSE (
    ECHO Uprading PIP Failed! Contact JTSDK^@Groups.io
    exit /b 1
)

:: CREATE JTPY ARY -------------------------------------------------------------
:CREATE_JTPY
ECHO.
ECHO ------------------------------
ECHO Creating JTPY Environment
ECHO ------------------------------
ECHO.
ECHO Creating JTPY Environment
conda create -y -n jtpy python^=3
GOTO EOF

:: ACTIVATE --------------------------------------------------------------------
:ACTIVATE
ECHO.
ECHO ------------------------------
ECHO Activating JTPY Environment
ECHO ------------------------------
ECHO.
ECHO Command^: conda activate jtpy
conda activate jtpy
GOTO EOF

:: INSTALL DEPS ----------------------------------------------------------------
:INSTALL_DEPS
ECHO.
ECHO ------------------------------
ECHO  Installing Scripts in JTPY
ECHO ------------------------------
ECHO.
ECHO Python Dependencies
python -m pip install --upgrade colorconsole
ECHO.
ECHO JT64 Common
python -m pip install --upgrade -i https://test.pypi.org/simple/ jt64common
ECHO.
ECHO JT64 Env
python -m pip install --upgrade -i https://test.pypi.org/simple/ jt64env
ECHO.
ECHO JT64 Version
python -m pip install --upgrade -i https://test.pypi.org/simple/ jt64version
ECHO.
ECHO JT64 Gentc
python -m pip install --upgrade -i https://test.pypi.org/simple/ jt64gentc
GOTO INSTALL_SUMMARY

:: INSTALL SUMMARY -------------------------------------------------------------
:INSTALL_SUMMARY
ECHO.
ECHO -----------------------------------------------------
ECHO  Miniconda Python Install Summary
ECHO -----------------------------------------------------
ECHO.
ECHO  JTSDK64 Tools Miniconda Installaiton is Complete.
ECHO  The following is a summary of the installation.
ECHO.
ECHO  Install Directory ..... %PYTHON_INSTALL_DIR%
ECHO  Virtual Env Created ... jtpy
ECHO  Installed Packages .... jt64common
ECHO                          jt64env
ECHO                          jt64version
ECHO                          jt64gentc
ECHO.
ECHO  To ensure the install worked properly, exit the setup
ECHO  environment, then re^-launch jtsdk64-tools-setup.
ECHO.
GOTO EOF

:: UPDATE INSTALLER-------------------------------------------------------------
:UPDATE_INSTALLER
SET curl_status=Not Available
SET name=Miniconda3-latest-Windows-x86_64.exe
SET url=https://repo.anaconda.com/miniconda/Miniconda3-latest-Windows-x86_64.exe
CLS
ECHO -----------------------------------------------------
ECHO  Update Miniconda Installer
ECHO -----------------------------------------------------
ECHO.
ECHO This method updates the Miniconda installer itself.
ECHO It requires ^(curl^) to be installed and available
ECHO from the command^-line.
ECHO.
ECHO Checking for curl
curl --version >NUL 2>&1
IF %ERRORLEVEL% == 0 (
    SET CURL_STATUS=Available
    GOTO CURL_AVAILABLE
    )
GOTO CURL_NOT_AVAILABLE

:CURL_AVAILABLE
PUSHD %SETUP_DIR%\miniconda
ECHO Curl Status : %curl_status%
ECHO.
ECHO Downloading New Installer
ECHO Installer Name : %name%
ECHO URL .......... : %url%
ECHO.
curl %url% -o %name%
POPD
ECHO.
ECHO Finished Download
GOTO EOF

:CURL_NOT_AVAILABLE
ECHO Curl Status : %curl_status%
ECHO.
ECHO In order to update the installer, ^(curl^) must be
ECHO installed and available from the command prompt.
ECHO.
ECHO Contact JTSDK^@Groups.io for assistence if needed.
ECHO.
GOTO EOF

:: INSTALL_HELP ----------------------------------------------------------------
:INSTALL_HELP
CLS
ECHO.
ECHO -------------------------------------------------------
ECHO  JTSDK64 Python Setup Help
ECHO -------------------------------------------------------
ECHO.
ECHO  Use the following commands to install and configure
ECHO  Miniconda Python. Follow the steps in order.
ECHO.
ECHO  pysetup help             Shows this help screen
ECHO  pysetup install          Install miniconda python
ECHO  pysetup update-conda     Update conda package
ECHO  pysetup upgrade-pip      Ugrade pip package installer
ECHO  pysetup create-env       Create the JTPY Environment
ECHO  pysetup activate         Activate the JTPY environment
ECHO  pysetup install-deps     Install package dependencies
ECHO  pysetup update-installer Update the Miniconda Installer
ECHO.
ECHO  One Command Install
ECHO    pysetup-all          Run all install commands
ECHO.
ECHO  Uninstall
ECHO    pysetup uninstall    Uninstall Miniconda Python
ECHO.
ECHO  To ensure the install worked properly, exit the setup
ECHO  environment, then re^-launch jtsdk64-tools-setup.
ECHO.
GOTO EOF

:UNINSTALL
cls
ECHO -----------------------------------------------------
ECHO  JTSDK64 Python Uninstall
ECHO -----------------------------------------------------
ECHO.
CD %PYTHON_INSTALL_DIR%
ECHO Running Uninstall-Miniconda3^.exe
Uninstall-Miniconda3^.exe
GOTO EOF

:EOF
CD %JTSDK64_HOME%
exit /b 0
