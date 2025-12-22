# Arch-WSL Installation

## Base install
- ArchWSL Official Distribution <https://wiki.archlinux.org/title/Install_Arch_Linux_on_WSL>

1. Install Arch Linux from Microsoft Store in WSL2 
2. Add a password for the root user 
```bash
passwd
```
3. Create a new user and set a password
```bash
useradd -m attilio
passwd attilio
```
4. Set this user as default in Arch Linux WSL (in Powershell)
```powershell
wsl --shutdown
wsl --manage archlinux --set-default-user attilio
```
5. Change back to root, update the keyring and install sudo
```bash
su root
pacman -Sy archlinux-keyring
pacman -Syu
pacman -S sudo
```
6. Add the wheel group to sudoers
```bash
echo "%wheel ALL=(ALL) ALL" > /etc/sudoers.d/wheel
```
7. Add the user to the wheel group
```bash
usermod -aG wheel attilio
```
8. Restart the terminal (logout)
9. Install yay <https://github.com/Jguer/yay>
10. Install zsh and set as the default terminal
```bash
chsh -s /bin/zsh
```
11. Restart the terminal (logout)
12. Install PowerLevel 10k <https://github.com/romkatv/powerlevel10k>
13. Install mamba

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

See `CLI Documentation/dotfiles` notes

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
    - Molden (checkout the custom .moldenrc file below)
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

Custom `.moldenrc` file
```bash
H 13 0.430000
He 9 0.741000
Li 1 0.880000
Be 2 0.550000
B 3 1.030000
C 4 0.900000
N 5 0.880000
O 7 0.880000
F 9 0.840000
Ne 9 0.815000
Na 1 1.170000
Mg 2 1.300000
Al 3 1.550000
Si 14 1.400000
P 6 1.250000
S 8 1.220000
Cl 10 1.190000
Ar 14 0.995000
K 1 1.530000
Ca 2 1.190000
Sc 13 1.640000
Ti 13 1.670000
V 4 1.530000
Cr 14 1.550000
Mn 1 1.555000
Fe 14 1.540000
Co 14 1.530000
Ni 14 1.700000
Cu 6 1.720000
Zn 14 1.650000
Ga 3 1.420000
Ge 14 1.370000
As 1 1.410000
Se 6 1.420000
Br 11 1.410000
Kr 14 1.069000
Rb 1 1.670000
Sr 11 1.320000
Y 14 1.980000
Zr 14 1.760000
Nb 14 1.680000
Mo 14 1.670000
Tc 14 1.550000
Ru 14 1.600000
Rh 14 1.650000
Pd 14 1.700000
Ag 9 1.790000
Cd 8 1.890000
In 3 1.830000
Sn 14 1.660000
Sb 1 1.660000
Te 6 1.670000
I 12 1.600000
Xe 14 1.750000
Cs 1 1.870000
Ba 11 1.540000
La 14 2.070000
Ce 14 2.030000
Pr 14 2.020000
Nd 14 2.010000
Pm 14 2.000000
Sm 14 2.000000
Eu 14 2.190000
Gd 14 1.990000
Tb 14 1.960000
Dy 14 1.950000
Ho 14 1.940000
Er 10 1.930000
Tm 10 1.920000
Yb 10 2.140000
Lu 10 1.920000
Hf 14 1.770000
Ta 14 1.630000
W 14 1.570000
Re 14 1.550000
Os 14 1.570000
Ir 14 1.520000
Pt 14 1.700000
Au 8 1.700000
Hg 4 1.900000
Tl 3 1.750000
Pb 14 1.740000
Bi 1 1.740000
Po 6 1.880000
At 11 0.200000
Rn 14 0.200000
Fr 1 0.200000
Ra 11 2.100000
Ac 14 2.080000
Th 14 1.990000
Pa 14 1.810000
U 14 1.780000
Np 14 1.750000
Pu 14 0.200000
Am 14 1.710000
Cm 1 0.200000
Bk 1 0.200000
Cf 12 1.730000
background 0 
oglbackground 13 
backgroundmode 0 
palette #AA5CF2 #C2FF00 #FFB5B5 #ADADAD #3333FF #FF7F00 #EA0026 #FFD023 #B2FFFF #1EF01E #A52929 #940094 #E5E5E5 #54B5B5 
newrot
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



