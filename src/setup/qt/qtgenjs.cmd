@echo off
::-----------------------------------------------------------------------------::
:: Name .........: qtgentc.cmd
:: Project ......: Part of the JTSDK64 Tools Project
:: Version ......: 3.1.0
:: Description ..: Generats QT installer JS scripts
:: Project URL ..: https://github.com/KI7MT/jtsdk64-tools-scripts.git
::
:: Author .......: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
:: Copyright ....: Copyright (C) 2013-2019 Greg Beam, KI7MT
:: License ......: GPL-3
::
:: Usage:
::      Minimal Install
::      qt-unified-windows-x86-online.exe --script .\qt-min-install.qs
::
::      Full Install
::      qt-unified-windows-x86-online.exe --script .\qt-full-install.qs
::
:: -----------------------------------------------------------------

:: Process input commands
IF /I [%1]==[] ( GOTO APP_INFO )
IF /I [%1]==[help] ( GOTO _HELP )
GOTO _HELP

:APP_INFO
set app_name=qt
set app_formal_name=Qt

:: source and output file paths
set source_dir=%JTSDK64_HOME%\tools\setup\qt
set tools_root=%JTSDK64_HOME%\tools
set out_file_path=%source_dir%

:: Qs scripts
set min_out_file_text=Write Qt Minimal Install Script
set min_out_file_name=qt-min-install.qs

set full_out_file_text=Write Qt Full Install Script
set full_out_file_name=qt-full-install.qs

:: app directories
set install_dir=%tools_root%\%app_formal_name%

:: covert back-slahes to forward-slashes, as Qt installer will fail otherwise
set "install_dir=%install_dir:\=/%"
goto INSTALL


:: -----------------------------------------------------------------
::  INSTALL SECTION
:: -----------------------------------------------------------------

:INSTALL
cls
echo ------------------------------
echo  Generate QT Install Scripts
echo ------------------------------
echo.
echo  Minimal Script
echo  Gen Script       : %min_out_file_text%
echo  Expected Path    : %out_file_path%
echo  Script Location  : %out_file_path%\%min_out_file_name%
echo.

>%out_file_path%\%min_out_file_name% (
echo function Controller^(^) ^{
echo  installer.autoRejectMessageBoxes^(^);
echo  installer.installationFinished.connect^(function^(^) ^{
echo   gui.clickButton^(buttons.NextButton^)^;
echo  ^}^)
echo ^}
echo.
echo Controller.prototype.WelcomePageCallback ^= function^(^) ^{
echo  gui.clickButton^(buttons.NextButton^, 3000^)^;
echo ^}
echo.
echo Controller.prototype.CredentialsPageCallback ^= function^(^)^{
echo  gui.clickButton^(buttons.NextButton^)^;
echo ^}
echo.
echo Controller.prototype.IntroductionPageCallback ^= function^(^) ^{
echo  gui.clickButton^(buttons.NextButton^)^;
echo ^}
echo.
echo Controller.prototype.TargetDirectoryPageCallback ^= function^(^) ^{
echo  gui.currentPageWidget^(^).TargetDirectoryLineEdit.setText^("%install_dir%"^)^;
echo  gui.clickButton^(buttons.NextButton^)^;
echo ^}
echo.
echo Controller.prototype.ComponentSelectionPageCallback ^= function^(^) ^{
echo  var widget ^= gui.currentPageWidget^(^)^;
echo  widget.deselectAll^(^)^;
echo  widget.selectComponent^("qt.tools.vcredist_msvc2017_x64"^)^;
echo  widget.selectComponent^("qt.tools.maintenance"^)
echo  widget.selectComponent^("qt.tools.qtcreator"^)^;
echo  widget.selectComponent^("qt.tools.win64_mingw730"^)^;
echo  widget.selectComponent^("qt.qt5.5124.win64_mingw73"^)^;
echo  gui.clickButton^(buttons.NextButton^)^;
echo ^}
echo.
echo Controller.prototype.LicenseAgreementPageCallback ^= function^(^) ^{
echo  gui.currentPageWidget^(^).AcceptLicenseRadioButton.setChecked^(true^);
echo  gui.clickButton^(buttons.NextButton^)^;
echo ^}
echo.
echo Controller.prototype.StartMenuDirectoryPageCallback ^= function^(^) ^{
echo  gui.clickButton^(buttons.NextButton^)^;
echo ^}
echo.
echo Controller.prototype.ReadyForInstallationPageCallback ^= function^(^)
echo ^{
echo   gui.clickButton^(buttons.NextButton^)^;
echo ^}
echo.
echo Controller.prototype.FinishedPageCallback ^= function^(^) ^{
echo   var checkBoxForm ^= gui.currentPageWidget^(^).LaunchQtCreatorCheckBoxForm
echo   if ^(checkBoxForm ^&^& checkBoxForm.launchQtCreatorCheckBox^) ^{
echo     checkBoxForm.launchQtCreatorCheckBox.checked ^= false^;
echo   ^}
echo   gui.clickButton^(buttons.FinishButton^);
echo ^}
)
if exist %out_file_path%\%min_out_file_name% >NUL 2>&1 (
    echo  Validation       : Passed, found ^(%min_out_file_name%^)
    echo.
) ELSE (
    GOTO GENERATE_ERROR
)
goto GEN_FULL


:: GENERATE FULL SCRIPT --------------------------------------------------------
:GEN_FULL
echo  Full Script
echo  Gen Script       : %full_out_file_text%
echo  Expected Path    : %out_file_path%
echo  Script Location  : %out_file_path%\%full_out_file_name%

:: install Qt Creator, QTLIBS, and GCC Tool Chain
>%out_file_path%\%full_out_file_name% (
echo function Controller^(^) ^{
echo  installer.autoRejectMessageBoxes^(^)^;
echo  installer.installationFinished.connect^(function^(^) ^{
echo   gui.clickButton^(buttons.NextButton^)^;
echo  ^}^)
echo ^}
echo.
echo Controller.prototype.WelcomePageCallback ^= function^(^) ^{
echo  gui.clickButton^(buttons.NextButton^, 3000^)^;
echo ^}
echo.
echo Controller.prototype.CredentialsPageCallback ^= function^(^)^{
echo  gui.clickButton^(buttons.NextButton^)^;
echo ^}
echo.
echo Controller.prototype.IntroductionPageCallback ^= function^(^) ^{
echo  gui.clickButton^(buttons.NextButton^)^;
echo ^}
echo.
echo Controller.prototype.TargetDirectoryPageCallback ^= function^(^) ^{
echo  gui.currentPageWidget^(^).TargetDirectoryLineEdit.setText^("%install_dir%"^)^;
echo  gui.clickButton^(buttons.NextButton^)^;
echo ^}
echo.
echo Controller.prototype.ComponentSelectionPageCallback ^= function^(^) ^{
echo  var widget ^= gui.currentPageWidget^(^)^;
echo  widget.deselectAll^(^)^;
echo  widget.selectComponent^("qt.tools.vcredist_msvc2017_x64"^)^;
echo  widget.selectComponent^("qt.tools.maintenance"^)
echo  widget.selectComponent^("qt.tools.qtcreator"^)^;
echo  widget.selectComponent^("qt.tools.win64_mingw730"^)^;
echo  widget.selectComponent^("qt.qt5.5122.win64_mingw73"^)^;
echo  widget.selectComponent^("qt.qt5.5123.win64_mingw73"^)^;
echo  widget.selectComponent^("qt.qt5.5124.win64_mingw73"^)^;
echo  widget.selectComponent^("qt.qt5.5130.win64_mingw73"^)^;
echo  gui.clickButton^(buttons.NextButton^)^;
echo ^}
echo.
echo Controller.prototype.LicenseAgreementPageCallback ^= function^(^) ^{
echo  gui.currentPageWidget^(^).AcceptLicenseRadioButton.setChecked^(true^)^;
echo  gui.clickButton^(buttons.NextButton^)^;
echo ^}
echo.
echo Controller.prototype.StartMenuDirectoryPageCallback ^= function^(^) ^{
echo  gui.clickButton^(buttons.NextButton^)^;
echo ^}
echo.
echo Controller.prototype.ReadyForInstallationPageCallback ^= function^(^)
echo ^{
echo   gui.clickButton^(buttons.NextButton^)^;
echo ^}
echo.
echo Controller.prototype.FinishedPageCallback ^= function^(^) ^{
echo   var checkBoxForm ^= gui.currentPageWidget^(^).LaunchQtCreatorCheckBoxForm
echo   if ^(checkBoxForm ^&^& checkBoxForm.launchQtCreatorCheckBox^) ^{
echo     checkBoxForm.launchQtCreatorCheckBox.checked ^= false^;
echo   ^}
echo   gui.clickButton^(buttons.FinishButton^)^;
echo ^}
)
if exist %out_file_path%\%full_out_file_name% >NUL 2>&1 (
    echo  Validation       : Passed, found ^(%full_out_file_name%^)
) ELSE (
    GOTO GENERATE_ERROR
)
goto EOF

:: HELP ------------------------------------------------------------------------
:_HELP
CLS
ECHO -------------------------------------------------------
ECHO  JTSDK64 Qt JS Script Gen Help
ECHO -------------------------------------------------------
ECHO.
ECHO  This script generates to JavaScripts used for automated
ECHO  Qt installation. There are ^(2^) versions^:
ECHO.
ECHO. 1. Minimial Script ^(qt^-min^-install^.js)
ECHO       Installs the following components:
ECHO       qt.tools.vcredist_msvc2017_x64
ECHO       qt.tools.maintenance
ECHO       qt.tools.qtcreator
ECHO       qt.qt5.5124.win64_mingw73
ECHO       qt.tools.win64_mingw730
ECHO.
ECHO  2. Full Script ^(qt^-full^-install^.js)
ECHO       Installs minimal^, plus additional versions
ECHO       qt.qt5.5122.win64_mingw73
ECHO       qt.qt5.5123.win64_mingw73
ECHO       qt.qt5.5130.win64_mingw73
ECHO.
ECHO  Usage:
ECHO    From within JTSDK64-Tools-setup
ECHO    Minimal Install ... qtsetup min
ECHO    Full Install ...... qtsetup full
ECHO.
GOTO EOF

:: GENERATOR ERROR ------------------------------------------------------------
:GENERATE_ERROR
echo.
echo  Post Install Test Failed!!
echo  Report error to JTSDK@Groups.io
exit /b 1

:EOF
echo.
exit /b 0