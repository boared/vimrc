import sys
from pathlib import Path

if __name__ == '__main__':
    print(f"Installing vimrc in '{sys.platform}' OS")

    # Create ~/.config if it doesn't exist
    config = Path.home().joinpath('.config/')
    config.mkdir(parents=True, exist_ok=True)

    # Create symbolic link of folder vimrc/.config/nvim
    try:
        config = config.joinpath('nvim')
        config.symlink_to(Path.cwd().joinpath('.config/nvim'), True)
    except FileExistsError:
        print(f"Path '{config}' already exist. Aborting.")
    else:
        print(f"Created symlink '{config}'")
