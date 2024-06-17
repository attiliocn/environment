#!/bin/bash

function setup-tmux() {
    tmux new-session -d -s docs -c $HOME/projects/docs "nvim registro\ de\ atividades.md"
    tmux new-session -d -s ssh
    tmux new-session -d -s exchange -c $HOME/projects/ufscar/ufscar.schrock-exchange
    tmux new-session -d -s metathesis -c $HOME/projects/ufscar/ufscar.schrock-metathesis
    tmux attach-session -t docs
}

