#!/bin/bash

function setup-tmux() {
    # new session for misc
    tmux new-session -ds misc
    # new session for backup utilites
    tmux new-session -ds bkp
    # new session for development/programming
    tmux new-session -ds dev
    # new session for ssh conections
    tmux new-session -ds ssh -n curie
    tmux new-window -t ssh -n ufscar
    # new session for jupyter notebooks
    tmux new-session -ds notebooks
    # new session for ufscar.slib project
    tmux new-session -ds slib -c "$HOME/projects/ufscar/ufscar.schrock-lib"
    # new session for ufscar.mox project
    tmux new-session -ds mox -c "$HOME/projects/ufscar/ufscar.schrock-exchange"
    # new session for ufscar.meta project 
    tmux new-session -ds meta -c "$HOME/projects/ufscar/ufscar.schrock-metathesis"
    
    # attach to tmux after setting up everything
    tmux attach-session -t misc
}