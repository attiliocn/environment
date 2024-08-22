# Windows 11 Settings

- Firefox
- Chrome
- Windows Terminal
- 7-zip
- Notepad++
- Microsoft Office
	- Word
	- Excel 
	- Powerpoint
- ChemDraw
- FoxitPDF
- Insync
- Synology Drive Client
- Adobe Software
	- Illustrator
	- Photoshop
	- LightRoom
- WSL2
- WinSCP 
	- Use Explorer interface. Then set display to "details"
	- Winssh-Pageant for WinSCP <https://github.com/ndbeals/winssh-pageant>
	- Fix the permissions of the keys in Windows then load them using open-ssh (windows side)
	```
	icacls *  /inheritance:r
	start-process "icacls.exe" -ArgumentList "* /grant:r ""$env:USERNAME"":""(R)"""
	```
- Equalizer Apo
	- Marvel GEQ <https://www.voxengo.com/product/marvelgeq/>
	- TDR Kotelnikov <https://www.tokyodawn.net/tdr-kotelnikov/>
	- rnnoise_stereo <https://github.com/werman/noise-suppression-for-voice/releases>
- Calibre
- Zotero
	- Better BibTex <https://github.com/retorquere/zotero-better-bibtex>
	- DOI Manager <https://github.com/bwiernik/zotero-shortdoi>
	- ZOT File <http://zotfile.com/>
		- Subfolder: \%T\%a
		- Rename (all types): {%a_}{%y_}{%t}
		- Rename (patents): {%a_}{%y_}{%t}
		- Max authors: 2
		- Num authors when omitted: 1
		- Add sufixx: et al
	- Zutilo <https://github.com/wshanks/Zutilo>
- VSCode
- OBS Studio
- VLC
- qBitTorrent
- AnkerWork
- geteduroam
- GlobalProtect VPN
- ScreentoGif
- Anydesk
- ThunderBird
- WhatsApp
- Spotify
- Fonts
	- MesloLGS
	- DejaVu Sans
