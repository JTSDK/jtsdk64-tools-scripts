# Name ..............: jtsdk-env-message.py
# Description .......: Print JTSDK64 Help Message
# Author ............: Greg, Beam, KI7MT, <ki7mt@yahoo.com>
# Copyright .........: Copyright (C) 2013-2019 Greg Beam, KI7MT
# License ...........: GPL-3
#
# jtsdk-env-message is free software: you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by the Free
# Software Foundation either version 3 of the License, or (at your option) any
# later version. 
#
# jtsdk-env-message is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
# details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

import os, sys, glob
from colorconsole import terminal

'''[Console Color Index]
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
'''
def clear():
    """Clear Screen Function"""
    os.system('cls' if os.name == 'nt' else 'clear')


def main():
    """JTSDK Main Menu Headder Message"""
    screen = terminal.get_terminal(conEmu=False)
    clear()
    print("--------------------------------------------------")
    screen.set_color(3,0)
    print(f"JTSDK64 Tools {os.environ['VERSION']} Help Menu")
    screen.reset_colors()
    print("--------------------------------------------------")
    print('{0:18}  {1}'.format("\nQT Version", os.environ["QTV"]))
    print('{0:17}  {1}'.format("Core Tools", os.environ["CORETOOLS"]))
    print('{0:17}  {1}'.format("Python Version", os.environ["PYTOOLS"]))
    print('{0:17}  {1}'.format("Postgres", os.environ["POSTGRES"]))
    print('{0:17}  {1}'.format("Unix Tools", os.environ["UNIXTOOLS"]))
    screen.cprint(14, 0, "\nFor Command List, Type: jtsdk-help\n")
    screen.reset_colors()


if __name__ == '__main__':
    main()
    sys.exit(0)

# End jtsdk-env-message.py