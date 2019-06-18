import os
import sys
import datetime
import time

from colorconsole import terminal
from subprocess import PIPE
from subprocess import run

from jt64setup import __version__

# NOTE: clear, pause, and cmd cannot be imported from jt64common.utils
# because Python nor the package may be available.


def clear():
    """Clear Screen Function"""
    os.system('cls' if os.name == 'nt' else 'clear')


def pause():
    """Simple pause command"""
    os.system("pause")


def cmd(command):
    """Default Subprocess Command
    Input
        str("command as string")
    Returns
        Output from shell command
    """
    result = run(command, stdout=PIPE, stderr=PIPE, universal_newlines=True, shell=True)
    return result.stdout


# Git Installation Data --------------------------------------------------------
git_version = "2.22.0"
git_inf = "git.inf"
git_installer = "Git-2.22.0-64-bit.exe"
git_srcd = os.path.join(os.environ["JTSDK64_HOME"],
                        "tools",
                        "setup",
                        "git")
git_install_command = git_installer + " /LOADINF=.\\" + git_inf + " /SILENT"


def install_git():
    clear()
    screen = terminal.get_terminal(conEmu=False)
    print(40 * "-")
    screen.set_color(3, 0)
    print(f"JTSDK64 Git Installation {__version__}")
    screen.reset_colors()
    print(40 * "-")
    print(f"\nGit Version ...... {git_version}")
    print(f"Git Inf File ..... {git_inf}")
    print(f"Git Installer .... {git_installer}")
    print(f"Git SRCD ......... {git_srcd}")
    print(f"Install Command .. {git_install_command}")
    print("")
    print("Starting Installation")
    os.chdir(git_srcd)
    cmd(git_install_command)
    print(f"Finished Installing Git {git_version}\n")
    pause()


def print_main_menu():
    # Print Main Menu
    clear()
    screen = terminal.get_terminal(conEmu=False)
    print(40 * "-")
    screen.set_color(3, 0)
    print(f"JTSDK64 Application Setup Main Menu")
    screen.reset_colors()
    print(40 * "-")
    print("1. Git Installation")
    print("2. Python Installation")
    print("3. Qt Installation")
    print("4. JT64 Package Installation")
    print("5. Verify Setup")
    print("6. Print JT64 Setup Version")
    print("9. Exit")
    print(40 * "-")


def main():
    """JTSDK Main Menu Headder Message"""
    choice = '0'
    while choice == '0':
        # print the main menu
        print_main_menu()

        # get selection from user
        selection = input("Please make selection [1-6 or 9]: ")

        # Process user selection
        if selection == "9":
            print(f"\nExit JT64 Setup at : {datetime.datetime.now()}")
            sys.exit(0)
        elif selection == "6":
            print(f"\nJT64 Setup Version : {__version__}\n")
            pause()
            main()
        elif selection == "5":
            print("Verifying Setup")
            pause()
            main()
        elif selection == "4":  #
            print("Do Something 4")
            pause()
            main()
        elif selection == "3":  # Qt Installation
            print("Do Something 3")
            pause()
            main()
        elif selection == "2":  # Python Installation
            print("Do Something 2")
            pause()
            main()
        elif selection == "1":  # Git Installation
            install_git()
            main()
        else:
            print(f"Invalid selection : ( {selection} )")
            pause()
            main()


def second_menu():
    print("\nThis is the second menu\n")
    pause()
    main()


if __name__ == '__main__':
    main()
