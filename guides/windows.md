# Windows 11 Setup Guide

## Main softwares to install

1. Firefox browser (https://www.firefox.com)
2. Chrome browser (https://www.google.com/intl/pt-BR/chrome/)
3. Google Drive Client
3. 7-zip (https://www.7-zip.org/)
4. Notepad++ (https://notepad-plus-plus.org/)
5. Microsoft Office (Word, Excel, Powerpoint)
6. Adobe CC (Photoshop, Illustrator, Lightroom Classic, Premiere Pro, Acrobat Pro)
7. Foxit PDF Reader (https://www.foxit.com/pt/pdf-reader/)
7. Windows Terminal
8. Powershell
9. Windows subsytem for linux (WSL2) (https://learn.microsoft.com/pt-br/windows/wsl/install)
10. Mozilla Thunderbird
> 💡 **Restoring Thunderbird Profile**
>
> 1. Install Thunderbird
> 2. Restore the Thunderbird Profile from the backup
> 3. Open the Thunderbird profile manager (Press `win + R` then execute `thunderbird -p`)
> 4. Add a new profile and point it to the restored backup
13. Fonts
	- MesloLGS
	- DejaVu Sans
    - Roboto


## Other softwares and apps
1. qBitTorrent (https://www.qbittorrent.org/)
2. qBitTorrent Search Plugins (https://github.com/qbittorrent/search-plugins/wiki/Install-search-plugins)
3. Steam (https://store.steampowered.com)
3. VLC Player (https://www.videolan.org/vlc/)
4. OBS Studio (https://obsproject.com)
5. Rust Desk (https://rustdesk.com)
6. WhatsApp Beta (Microsoft Store)
7. Spotify (Microsoft Store)
8. Stremio (https://www.stremio.com/)
8. AnkerWork (https://us.ankerwork.com)
10. Anki (https://apps.ankiweb.net/)


## Computational Chemistry / Science / Dev
1. VSCode (https://code.visualstudio.com/)
2. Calibre Portable (Restore from backup) (https://calibre-ebook.com/)
2. Zotero 7
    > ✅ Turn on synchronization to Zotero Cloud
    >
    > ✅ Disable file synchronization
    >
    > ✅ Set the file storage to relative and point it to Google Drive
4. Zotero 7 Plugins
    - Zotmoov (https://github.com/wileyyugioh/zotmoov)
        > ✅ Set "Subdirectory String" `{%T}/{%a}`
        >
        > ✅ Point the storage to Google Drive
    - Better BibTex (https://github.com/retorquere/zotero-better-bibtex)
    - DOI Manager (https://github.com/bwiernik/zotero-shortdoi)
    - Zutilo (https://github.com/wshanks/Zutilo)

1. Avogadro 1
3. Avogadro 2
4. Chemdraw 23
1. GaussView

## UFSCar-related software
- geteduroam (https://www.eduroam.app/)
- GlobalProtect VPN (https://acessoremoto.ufscar.br)



## Deprecated / Legacy software
- WinSCP 
> Use Explorer interface. Then set display to "details"
> Winssh-Pageant for WinSCP (https://github.com/ndbeals/winssh-pageant)
>
> Fix the permissions of the keys in Windows then load them using open-ssh (windows side) using: 
> ```
> icacls *  /inheritance:r
> start-process "icacls.exe" -ArgumentList "* /grant:r ""$env:USERNAME"":""(R)"""
> ```

- Equalizer Apo and plugins
	- Marvel GEQ (https://www.voxengo.com/product/marvelgeq/)
	- TDR Kotelnikov (https://www.tokyodawn.net/tdr-kotelnikov/)
	- rnnoise_stereo (https://github.com/werman/noise-suppression-for-voice/releases)