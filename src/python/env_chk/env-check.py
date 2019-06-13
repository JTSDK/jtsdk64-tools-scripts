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

def env_item(value):
    status = os.getenv(value)
    return status

def main():
    clear()
    screen = terminal.get_terminal(conEmu=False)
    print("------------------------------------------------------------")
    screen.set_color(3,0)
    print(f"JTSDK64 Tools {os.environ['VERSION']} Environment Variables")
    screen.reset_colors()
    print("------------------------------------------------------------")
    print("\nJTSDK Variables\n")
    print(f"  JTSDK Version ..: {env_item('JTSDK_VERSION')}")
    print(f"  JTSDK Home .....: {env_item('JTSDK_HOME')}")
    print(f"  JTSDK Config ...: {env_item('JTSDK_CONFIG')}")
    print(f"  JTSDK Data .....: {env_item('JTSDK_DATA')}")
    print(f"  JTSDK Tmp ......: {env_item('JTSDK_TMP')}")
    print(f"  JTSDK Scripts ..: {env_item('JTSDK_SCRIPTS')}")
    print("\nQT Variables\n")
    print(f"  QT Version  ....: {env_item('QTV')}")
    print(f"  QT Directory ...: {env_item('QTD')}")
    print(f"  QT Plugins .....: {env_item('QTP')}")
    print(f"  GCC Directory ..: {env_item('GCCD')}")
    print("\nConfiguration Options\n")
    print(f"  Python Tools ...: {env_item('PYTOOLS')}")
    print(f"  PostgreSQL .....: {env_item('POSTGRES')}")
    print(f"  Unix Tools .....: {env_item('UNIXTOOLS')}")


if __name__ == '__main__':
    main()
    sys.exit(0)

# End jtsdk-env-message.py