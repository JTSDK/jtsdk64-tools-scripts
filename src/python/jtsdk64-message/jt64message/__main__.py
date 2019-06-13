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
    print('{0:17}  {1}'.format("Python", os.environ["PYTOOLS"]))
    print('{0:17}  {1}'.format("Postgres", os.environ["POSTGRES"]))
    print('{0:17}  {1}'.format("Unix Tools", os.environ["UNIXTOOLS"]))
    screen.cprint(14, 0, "\nFor Command List, Type: jtsdk-help\n")
    screen.reset_colors()


if __name__ == '__main__':
    main()
    sys.exit(0)
