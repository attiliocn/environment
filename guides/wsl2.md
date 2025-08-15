# Arch-WSL Installation

## Base install
- ArchWSL Official Distribution <https://wiki.archlinux.org/title/Install_Arch_Linux_on_WSL>
- Update pacman mirrolist <https://archlinux.org/mirrorlist/>
- yay <https://github.com/Jguer/yay>
- PowerLevel 10k <https://github.com/romkatv/powerlevel10k>
- mamba

> 💡 **Tip:** Use `reflector` for select the best mirrors easily. 
```bash
sudo reflector --country Brazil --latest 5 --protocol http --protocol https --sort rate --save /etc/pacman.d/mirrorlist
```


## System Tools and Softwares
- Install texlive from `https://tug.org/texlive/quickinstall.html`
- Install the software listed below using yay

    ```bash
    yay -S \
        borgbackup \
        dos2unix \
        git \
        imagemagick \
        inkscape \
        neovim \
        openbabel \
        openssh \
        pdftk \
        perl-rename \
        rclone \
        rsync \
        tree \
        unzip \
        wget \
        xsel \
        zsh \
        keychain \
        tmux \
        man-db
    ```

    ```bash
    yay -S gcc gcc-fortran
    ```

    ```bash
    yay -S make lapack blas glew glm qt5 libxcrypt-compat
    ```

- CLIWizard
    ```bash
    # INSTALLATION
    # development environment
    git -C "$HOME"/repositories clone git@github.com:attiliocn/cliwizard.git
    # user environment
    git -C "$HOME"/opt clone https://github.com/attiliocn/cliwizard.git
    
    # SHELL SETTINGS
    # cli-wizard
    export CLIWIZARD_HOME="$HOME"/repositories/cliwizard
    source "$CLIWIZARD_HOME"/install.sh
    ```
- Environment Tools
    ```bash
    # INSTALLATION
    git -C "$HOME"/repositories clone git@github.com:attiliocn/environment.git
    
    # SHELL SETTINGS
    # source the tmux auto configurator
    source $HOME/repositories/environment/tmux/setup-tmux.sh
    ```
- SSH Agent using KeyChain. Add to the shell rc file
    ```bash
    # load ssh keys using keychain
    function loadkeys(){
        eval `keychain --eval $(find "$HOME"/.ssh/keys -maxdepth 1 -type f -not -name "*pub")`
    }
    ```
- nvim settings
    ```bash
    git -C "$HOME"/repositories clone git@github.com:attiliocn/nvim.git
    ln -s "$HOME/repositories/nvim" "$HOME"/.config
    ```

## ZSH Settings 
Update the `"$HOME"/.zshrc` file with the content below
```bash
# Use modern completion system
autoload -Uz compinit
compinit
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# ~/.zsh_history settings
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt histignorealldups sharehistory

# zsh keyboard settings
bindkey "^[[3~" delete-char
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

# zsh ls colors
export LS_COLORS="$LS_COLORS:ow=1;34:tw=1;34:*.tar=1;31:*.gz=1;31:*.tbz2=1;31"

# environment variables
export PATH=""$PATH":"$HOME"/bin"

# aliases
alias tmux='tmux -2'
alias ls='ls --color=auto'
alias grep='grep --color'
alias ..='cd ..'
alias rm='rm -v'
alias md='mkdir'
alias lls='ls -l -h -v --group-directories-first'
alias ks='ls -1vh --group-directories-first'
alias ll='ls -l'
alias vi='nvim'
alias ee='explorer.exe .'
```

## DOTFILES

`"$HOME"/.gitconfig`
```
[user]
        name = Attilio Chiavegatti
        email = attiliochiavegatti@gmail.com
[init]
        defaultBranch = main
[core]
        editor = vim
```

`"$HOME"/.pymolrc`
```python
import pymolstyles
set connect_mode, 2
```

`"$HOME"/.ssh/config`
```bash
Host *
ServerAliveInterval 20
IdentityFile KEY_ED

Host dalton
HostName dalton.iqm.unicamp.br
Port 22
User attilio
IdentityFile KEY_RSA
ForwardX11 yes

Host dalton.tulio
HostName dalton.iqm.unicamp.br
Port 22
User tulio
IdentityFile /home/attilio/.ssh/keys.dalton/tulio
HostKeyAlgorithms +ssh-rsa
PubkeyAcceptedKeyTypes +ssh-rsa
ForwardX11 yes

Host lobo
HostName loboc.nacad.ufrj.br
Port 2022
User attiliocn
ForwardX11 yes

Host lobo.giovanna
HostName loboc.nacad.ufrj.br
Port 2022
User giotamega
ForwardX11 yes

Host ufscar
HostName openhpc.ufscar.br
Port 22
User u728553
ForwardX11 no

Host ufscar.rafaela
HostName openhpc.ufscar.br
Port 22
User u831869
ForwardX11 no

Host ufscar.alex
HostName openhpc.ufscar.br
Port 22
User u835191
ForwardX11 no

Host ufscar.clarice
HostName openhpc.ufscar.br
Port 22
User u713546
ForwardX11 no

Host ufscar.giovanna
HostName openhpc.ufscar.br
Port 22
User u770351
ForwardX11 no

Host ufscar.marco
HostName openhpc.ufscar.br
Port 22
User u706537
ForwardX11 no

Host ufscar.mateus
HostName openhpc.ufscar.br
Port 22
User u570443
ForwardX11 no

Host ufscar.ariel
HostName openhpc.ufscar.br
Port 22
User u759234
ForwardX11 no

Host curie
HostName 200.133.233.250
Port 22
User attilio.chiavegatti
ForwardX11 no
```

`"$HOME"/.tmux.conf`
```bash
set-option -a terminal-features 'xterm-256color:RGB'

set -g status-style "bg=black"

set -g prefix C-b
set -g prefix2 C-space

bind-key r source-file ~/.tmux.conf

set -g mouse on

# bind-key h select-pane -L
# bind-key l select-pane -R
# bind-key j select-pane -D
# bind-key k select-pane -U

bind-key -n M-Left select-pane -L
bind-key -n M-Right select-pane -R
bind-key -n M-Down select-pane -D
bind-key -n M-Up select-pane -U

set-option -g allow-rename off

bind-key c new-window -c "#{pane_current_path}"
bind-key | split-window -h -c "#{pane_current_path}"
bind-key - split-window -v -c "#{pane_current_path}"
unbind-key '"'
unbind-key %
```

## Computational Chemistry Softwares
- Default mamba environment
    - Requires `default.yml` environment file
    - `mamba env create -f default.yml`
    - Install PyEnergyDiagrams from <https://github.com/giacomomarchioro/PyEnergyDiagrams>
- Compile from source
    - Molden
    - Pymol
    - NBO7
    - nciplot
- Install from binaries
    - Gaussian
    - Orca
    - xtb
    - crest
- Scripts
    - OfakeG
    - Softwares from my GitHub
        ```bash
        # INSTALLATION
        # development environment
        git -C "$HOME"/repositories clone git@github.com:attiliocn/chemtools.git
        git -C "$HOME"/repositories clone git@github.com:attiliocn/chemparser.git
        git -C "$HOME"/repositories clone git@github.com:attiliocn/pymolstyles.git
        git -C "$HOME"/repositories clone git@github.com:attiliocn/bobbuilder.git
        git -C "$HOME"/repositories clone git@github.com:attiliocn/cjobs.git
        
        # user environment
        git -C "$HOME"/opt clone https://github.com/attiliocn/chemtools.git
        ```

    - Shell settings (`bash` or `zsh`)
       - Paste this content in `.zshrc` or `.bashrc`
            ```bash
            # !--- Computational Chemistry Software --!
            # chemtools
            export CHEMTOOLS_DIR="$HOME"/repositories/github/chemtools
            source "$CHEMTOOLS_DIR"/install.sh
            
            # orca
            export ORCA="$HOME"/opt/orca_5_0_4_linux_x86-64_shared_openmpi411
            export LD_LIBRARY_PATH="$LD_LIBRARY_PATH":"$ORCA"
            
            # gaussian
            export g16root=""$HOME"/opt/chemsoft/gaussian-16_C.01"
            export GAUSS_EXEDIR="$g16root/g16"
            export GAUSS_SCRDIR="$g16root/scr"
            alias g16="$GAUSS_EXEDIR/g16"
            
            # xtb
            export MKL_NUM_THREADS=6
            export OMP_NUM_THREADS=6
            export OMP_STACKSIZE=4G
            export OMP_MAX_ACTIVE_LEVELS=1
            ulimit -s unlimited
            export XTBHOME="$HOME"/opt/chemsoft/xtb-bleed
            source $XTBHOME/share/xtb/config_env.bash
            
            # crest
            export PATH=""$PATH":"$HOME"/opt/chemsoft/crest-2.12"

            # nbo
            export PATH=""$PATH":"$HOME"/opt/chemsoft/nbo7/bin"

            # nciplot
            export NCIPLOT_HOME="$HOME"/opt/chemsoft/nciplot
            
            # bobbuilder
            export PYTHONPATH="$PYTHONPATH":"$HOME"/repositories/bobbuilder/bobbuilder
            
            # cjobs
            export PATH="$PATH":"$HOME"/repositories/cjobs/cjobs
            
            # activate the mamba default environment
            # requires mamba init SHELL
            mamba activate default
            ```

## Fix for WSLg
For diagnosing problems see <https://github.com/microsoft/wslg/wiki/Diagnosing-%22cannot-open-display%22-type-issues-with-WSLg>

The fix below is from <https://superuser.com/questions/1617298/wsl-2-running-ubuntu-x-server-cant-open-display>

>For me the problem was about /tmp/.X11-unix. It needs to be a symlink to /mnt/wslg/.X11-unix, but for me it was an empty directory. I temporarily fixed the problem like this:
>
>`rmdir /tmp/.X11-unix && ln -s /mnt/wslg/.X11-unix /tmp/.X11-unix`
>
>However, the symlink was removed again every time WSL was started. This seems to have been caused by either my tmp.mount or systemd-tmpfiles-setup.service of systemd, which clears the /tmp directory. I solved it by creating this file in /etc/systemd/system/wslg.service:
>An then enabling it using systemctl enable wslg.

```
[Unit]
Description=symlink /tmp/.X11-unix
After=systemd-tmpfiles-setup.service

[Service]
Type=oneshot
ExecStart=rmdir /tmp/.X11-unix
ExecStart=ln -s /mnt/wslg/.X11-unix /tmp/

[Install]
WantedBy=sysinit.target
```


