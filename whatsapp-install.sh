#!/bin/bash
mkdir -p /home/$USER/.wine/whatsapp
env WINEARCH=win64 WINEPREFIX="/home/$USER/.wine/whatsapp" winetricks nocrashdialog dotnet48 win10
cd /tmp
wget https://web.whatsapp.com/desktop/windows/release/x64/WhatsAppSetup.exe
7z x WhatsAppSetup.exe
7z x WhatsApp*.nupkg
mkdir -p /home/$USER/.wine/whatsapp/drive_c/whatsapp
mv lib/net45/* /home/$USER/.wine/whatsapp/drive_c/whatsapp/


#Create shortcut
cat > /home/$USER/.local/share/applications/whatsapp.desktop <<DESKTOP_FILE
[Desktop Entry]
Type=Application
Categories=Network;
Name=WhatsApp
Exec=env WINEPREFIX=\"/home/$USER/.wine/whatsapp\" wine C:\\\\\\\\whatsapp\\\\\\\\WhatsApp.exe
StartupNotify=true
Terminal=false
X-KeepTerminal=false
Name[en_US]=WhatsApp
StartupWMClass=WhatsApp.exe
Icon="/home/$USER/.wine/whatsapp/drive_c/users/$USER/Application Data/WhatsApp/app.ico"
DESKTOP_FILE
chmod +x /home/$USER/.local/share/applications/whatsapp.desktop
