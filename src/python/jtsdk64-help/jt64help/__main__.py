import os
import sys
from colorconsole import terminal


# TODO: Move listing to a common text file
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


# TODO: Move to jt64common package
def clear():
    """Clear Screen WIndows of *Nix"""
    os.system('cls' if os.name == 'nt' else 'clear')


def main():
    """Prints Main Help Message"""
    clear()
    screen = terminal.get_terminal(conEmu=False)
    print("------------------------------------------------------------")
    screen.set_color(3, 0)
    print(f"JTSDK64 Tools {os.environ['VERSION']} Help Menu")
    screen.reset_colors()
    print("------------------------------------------------------------")
    print("")
    print("The following commands are available throughout the JTSDK64")
    print("Tools Environment.")
    print("\nScripts Commands\n")
    print('{0:15}  {1}'.format("  jt64help", "Print This Help Menu"))
    print('{0:15}  {1}'.format("  jt64en", "Lists All Environment Variables"))
    print('{0:15}  {1}'.format("  jt64gentc", "Generate Tool Chain Files"))
    print('{0:15}  {1}'.format("  jt64version", "Checks Tool-Chain Versions"))
    print("\nShortcut Commands\n")
    print('{0:15}  {1}'.format("  home", "Return back to home directory"))
    print('{0:15}  {1}'.format("  msys2", "Launch MSYS2 Console"))


if __name__ == '__main__':
    main()
    sys.exit(0)
