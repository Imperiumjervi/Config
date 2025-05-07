## Installation
for ubuntu or debian based systems:
```bash
sudo apt update
sudo apt install neovim git curl wget gcc unzip clangd npm
git clone https://github.com/Imperiumjervi/Config.git
cd Config
chmod +x install.sh
./install.sh
```

for arch based systems:
```bash
sudo pacman -Syu
sudo pacman -S neovim git curl wget gcc unzip clang npm
git clone https://github.com/Imperiumjervi/Config.git
cd Config
chmod +x install.sh
./install.sh
```

## Dependencies
Dependencies for both distros (debian based and arch based):
```bash
npm install -g pyright typescript typescript-language-server 
```

## Description
This Neovim config is powered by LazyVim, and I’ve curated a set of excellent plugins to enhance the development experience. 
Some custom commands are set up to work with C++ projects, but you can easily create your own commands.

## Features:
The master in this case is space to do keymaps 
To open the nvimtree just do <Crtl> + n 
To open the telescope just do <Crtl> + t


So, this config has good plugins, some of them are:
1. LazyVim (powered by itself)
2. autocompletion
3. Copilot (Github Copilot integration)
4. Colorscheme (Dracula theme)
5. Dashboard (custom startup screen)
6. Basic formatting 
7. Lsp (actually only work with java, javascript, python, c, cpp and lua)
8. Navigation with nvimtree and telescope
9. Statusline (lualine)
10. Syntax Highlighting (nvim-treesitter)
11. Floating terminal (toggleterm)
12. Which key (to see the keymaps)
13. Indentation guides (indent-blankline)
14. Autopairs (Automatic closing of brackets and quotes)
15. Plugins to work with Github (gitsigns, vim_fugitive)
16. Mason (To install your oww lsp servers)
