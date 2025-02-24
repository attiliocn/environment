#!/bin/bash

function setup-tmux() {
    # new session for documentation and log 
    tmux new-session -ds docs -c "$HOME/projects/_manager" "nvim log-2025.md"
    tmux split-window -v -t docs
    # new session for backup utilites
    tmux new-session -ds bkp
    # new session for development/programming
    tmux new-session -ds dev
    # new session for ssh conections
    tmux new-session -ds ssh
    tmux new-window -t ssh -n curie
    tmux new-window -t ssh -n ufscar
    # new session for ufscar.slib project
    tmux new-session -ds slib -c "$HOME/projects/ufscar/ufscar.schrock-lib"
    # new session for ufscar.mox project
    tmux new-session -ds mox -c "$HOME/projects/ufscar/ufscar.schrock-exchange"
    # new session for ufscar.vox project
    tmux new-session -ds vox -c "$HOME/projects/ufscar/ufscar.vanadium"
    # new session for ufscar.meta project 
    tmux new-session -ds meta -c "$HOME/projects/ufscar/ufscar.schrock-metathesis"
    
    # attach to the docs session after setting up everything
    tmux attach-session -t docs
}

