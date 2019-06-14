import os
from colorconsole import terminal

from jt64common import __qt_version_dict__

def clear():
    """Clear Screen WIndows of *Nix"""
    os.system('cls' if os.name == 'nt' else 'clear')

def supported_versions():
    """Print list of supported QT Frameworks from qt_version_dict"""
    clear()
    screen = terminal.get_terminal(conEmu=False)
    print("---------------------------------------------")
    screen.set_color(3, 0)
    print(f"Supported QT Frameworks")
    screen.reset_colors()
    print("---------------------------------------------\n")
    for k, v in __qt_version_dict__.items():
        print(f" Version {k} using {v}")
