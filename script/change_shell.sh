#!/usr/local/bin/bash

function change_shell {
    which fish | sudo tee -a /etc/shells
    chsh -s $(which fish)
}

sudo -v
change_shell
