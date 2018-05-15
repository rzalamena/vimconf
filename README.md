# vimconf

## Summary

This is my current vim configuration and I use it with the following
programming languages:

* C
* Elixir (+ Phoenix Framework)
* LaTeX
* Markdown
* JavaScript
* HTML / (S)CSS
* Python
* Ruby


## Plugins

I'm using the plugin manager:
[vim-plug](https://github.com/junegunn/vim-plug).
It's simple, works with NeoVim and does async plugin updates.

This is the list of installed plugins:

* vim-airline: a cool looking status bar
* nerdtree: file navigator (open it with F3)
* vim-elixir: Elixir syntax support and colors
* alchemist.vim: Elixir auto-completion and documentation display
  (press K on normal mode)
* ctrlp.vim: allows to navigate project files with CTRL + p
* vim-phoenix: phoenix framework related features
* vim-surround: add/remove paranteses/quotes/html tags
* ale: linting using system tools (see w0rp/ale repo for more info)
* ultisnips: code snippets to speed up common boiler plate code
* gitgutter: display git versioned file lines modifications
* monokai: the default theme


## Install

To start using this configuration you should clone this repository to
your home .vim directory and create a symbolic link for vimrc.

```shell
git clone https://github.com/rzalamena/vimconf ${HOME}/.vim
ln -s $HOME/.vim/init.vim $HOME/.vimrc

# Optionally for gvim
ln -s $HOME/.vim/gvimrc ${HOME}/.gvimrc

# To also work with neovim
ln -s $HOME/.vim $HOME/.config/nvim
```

Don't forget to install the plugins on the first run with (normal mode):

```
:PlugInstall
```

And remember that you can always update the installed plugins with:

```
:PlugUpdate
```
