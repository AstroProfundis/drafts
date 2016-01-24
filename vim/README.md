# My VIM configurations

Requires VIM version 7.3 or later, use the lite version if using VIM version older than 7.3 or on old systems (eg. RHEL 5).

Works on most morden Linux distributions and OS X, Windows is not supported yet.

## Installation

After cloned this repo to your local, update the submodules:

    git submodule update --init --recursive

And then copy all the files to your home directory:

    mkdir -p ~/vim.bak && mv ~/.vim{,rc} ~/vim.bak/
    cp -rf vim/.vim* ~/

And all is done.
