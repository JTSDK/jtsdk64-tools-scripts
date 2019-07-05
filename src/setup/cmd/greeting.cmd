::-----------------------------------------------------------------------------::
:: Name .........: greeting.cmd
:: Project ......: Part of the JTSDK64 Tools Project
:: Version ......: 3.1.0
:: Description ..: Setup Tools Greeting message
:: Project URL ..: https://github.com/KI7MT/jtsdk64-tools-scripts.git
:: Usage ........: Call this file directly from the command line
::
:: Author .......: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
:: Copyright ....: Copyright (C) 2013-2019 Greg Beam, KI7MT
:: License ......: GPL-3
::-----------------------------------------------------------------------------::
CLS
ECHO --------------------------------------------
ECHO  JTSDK64 Tools Setup v%version%
ECHO --------------------------------------------
ECHO.
ECHO  Core Tool Status
ECHO     Git .......... %GIT_STATUS%
ECHO     Python ....... %PYTHON_STATUS%
ECHO     VS Code ...... %VSCODE_STATUS%
ECHO     JTPY Env ..... %JTPY_STATUS%
ECHO.
ECHO  Qt Tool Chain Status
ECHO     5.12.2 ....... %QT5122_STATUS%
ECHO     5.12.3 ....... %QT5123_STATUS%
ECHO     5.12.4 ....... %QT5124_STATUS%
ECHO     5.13.0 ....... %QT5130_STATUS%
ECHO     GCC 7.3 ...... %GCC73_STATUS%
ECHO     QtCreator .... %QTCREATOR_STATUS%
ECHO     Maintenance .. %QTMAINT_STATUS%

::ECHO.
:: For future releases
::ECHO  Other Tool Status
::ECHO     Postgres ..... %PGSQL_STATUS%
::ECHO     Dotnet SDK ... %DOTNET_STATUS%
::ECHO     Java ......... %JAVA_STATUS%
ECHO.
ECHO  Help Commands
ECHO     Git .......... gitsetup help
ECHO     Python ....... pysetup help
ECHO     VS Code ...... codesetup help
ECHO     Qt ........... qtetup help
ECHO.