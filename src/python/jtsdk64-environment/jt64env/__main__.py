import os
import sys
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
    """Clear screen Windows or *Nix"""
    os.system('cls' if os.name == 'nt' else 'clear')


def env_item(value):
    """Return status of environment variable"""
    status = os.getenv(value)
    return status


def main():
    """Screen print environment variables"""
    clear()
    screen = terminal.get_terminal(conEmu=False)
    print("------------------------------------------------------------")
    screen.set_color(3, 0)
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
