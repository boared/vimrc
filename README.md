Although this repo's name is `vimrc` it should be called my dotfiles ¯\_(ツ)_/¯

## Installing the configs
Run `$ python install.py`. It will create symbolic links to the files and folders in this repo. This way any updates in the repo will reflect in your installation of nvim.

## Nerd Fonts
### MacOS
Install the Nerd Font via:
```
brew tap homebrew/cask-fonts
brew install font-hack-nerd-font
```

Once it is installed, configure on your favorite terminal emulator to use the font.

### Linux
#### Install [`Hack Nerd Font`](https://www.nerdfonts.com/font-downloads)
1. Download the Nerd Font
1. Unzip the file and copy the content to $HOME/.fonts
1. Run the command `fc-cache -fv` to manually rebuild the font cache
1. Configure your favorite terminal emulator to use the font.
