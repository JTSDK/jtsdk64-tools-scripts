import os

def clear():
    """Clear Screen WIndows of *Nix"""
    os.system('cls' if os.name == 'nt' else 'clear')