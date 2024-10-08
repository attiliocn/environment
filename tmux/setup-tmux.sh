#!/bin/bash

function setup-tmux() {
    tmux new-session -d -s docs -c $HOME/md "nvim caderno\ laboratorio\ vol2.md"
    tmux new-session -d -s bkp
    tmux new-session -d -s dev
    tmux new-session -d -s ssh
    tmux new-window -t ssh -n curie
    tmux new-window -t ssh -n ufscar
    tmux new-session -d -s slib -c $HOME/projects/ufscar/ufscar.schrock-lib
    tmux new-session -d -s mox -c $HOME/projects/ufscar/ufscar.schrock-exchange
    tmux new-session -d -s vox -c $HOME/projects/ufscar/ufscar.vanadium
    tmux new-session -d -s meta -c $HOME/projects/ufscar/ufscar.schrock-metathesis
    tmux attach-session -t docs
}

