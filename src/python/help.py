# Name ..............: jtsdk-help.py
# Description .......: Print JTSDK64 Help Message
# Author ............: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
# Copyright .........: Copyright (C) 2013-2019 Greg Beam, KI7MT
# License ...........: GPL-3
#
# jtsdk-help is free software: you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by the Free
# Software Foundation either version 3 of the License, or (at your option) any
# later version. 
#
# jtsdk-help is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
# details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

from __future__ import print_function

import os, sys
from colorconsole import terminal

"""[Console Color Index]
    Number  Color
    0 	    Black
    1 	    Blue
    2 	    Green
    3 	    Cyan
    4 	    Red
    5 	    Purple
    6 	    Brown
    7 	    Light gray
    8 	    Dark gray
    9 	    Light blue
    10 	    Light Green
    11 	    Light Cyan
    12 	    Light Red
    13 	    Light Purple
    14 	    Yellow
    15 	    White
"""
def clear():
    os.system('cls' if os.name == 'nt' else 'clear')


def main():
    clear()
    screen = terminal.get_terminal(conEmu=False)
    print("------------------------------------------------------------")
    screen.set_color(3,0)
    print(f"JTSDK64 Tools {os.environ['VERSION']} Help Menu")
    screen.reset_colors()
    print("------------------------------------------------------------")
    print("")
    print("The following commands are available throughout the JTSDK64")
    print("Tools Environment.")
    print("\nScripts Commands\n")
    print('{0:15}  {1}'.format("  jtsdk-help", "Print This Help Menu"))
    print('{0:15}  {1}'.format("  env-check", "Lists All Environment Variables"))
    print('{0:15}  {1}'.format("  gentc", "Generate Tool Chain Files"))
    print('{0:15}  {1}'.format("  version-check", "Checks Tool-Chain Versions"))
    print("\nShortcut Commands\n")
    print('{0:15}  {1}'.format("  home", "Return back to home directory"))
    print('{0:15}  {1}'.format("  msys2", "Launch MSYS2 Console"))

if __name__ == '__main__':
    main()
    sys.exit(0)

# End jtsdk-env-message.py