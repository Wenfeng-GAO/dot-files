# dot-files

Setup develop tools and environment for the brand new Macbook.

## Softwares to install
- iterm2

## install homebrew
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
## install oh-my-zsh
```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
## brew install z
## customize .zshrc
change `/Users/hengzhuo` to real home path
```bash
export ZSH="/Users/hengzhuo/.oh-my-zsh"
```
## customize .vimrc
1. install [vundle](https://github.com/VundleVim/Vundle.vim)
    ```bash
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    ```
2. customize .vimrc
3. launch vim and run `:PluginInstall`
4. install vim with python3
    ```bash
    brew install vim
    zsh
    ```
