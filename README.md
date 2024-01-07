## Installing the configs
Run `$ python install.py`. It will create symbolic links to the files and folders in this repo. This way any updates in the repo will reflect in your installation of nvim.

## Nerd Fonts
### MacOS + iTerm2
Install the Nerd Font via:
```
brew tap homebrew/cask-fonts
brew install font-hack-nerd-font
```

Once it is installed, go to iTerm2 -> Preferences -> Profilex -> Text -> Font and set it to the Nerd Font

### Linux
#### Install [`Hack Nerd Font`](https://www.nerdfonts.com/font-downloads)
This step is necessary to show icons properly on `nvim-tree`
1. Download the Nerd Font
1. Unzip the file and copy the content to $HOME/.fonts
1. Run the command `fc-cache -fv` to manually rebuild the font cache
