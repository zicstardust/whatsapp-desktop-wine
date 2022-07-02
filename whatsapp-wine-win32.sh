#requisitos
#7zip, wine, imagemagick, curl



mkdir /home/$USER/.wine/
mkdir /home/$USER/.wine/whatsapp
env WINEARCH=win32 WINEPREFIX="$USER/.wine/whatsapp" winetricks dotnet48
env WINEARCH=win32 WINEPREFIX="$USER/.wine/whatsapp" winecfg -v win8
cd /tmp
curl https://web.whatsapp.com/desktop/windows/release/ia32/WhatsAppSetup.exe
7z x WhatsAppSetup.exe
7z x WhatsApp*.nupkg
mkdir /home/$USER/.wine/whatsapp/drive_c/whatsapp
mv lib/net45/* /home/$USER/.wine/whatsapp/drive_c/whatsapp/


#Create shortcut
echo "[Desktop Entry]" >> /home/$USER/.local/share/applications/whatsapp.desktop
echo "Type=Application" >> /home/$USER/.local/share/applications/whatsapp.desktop
echo "Categories=Network;" >> /home/$USER/.local/share/applications/whatsapp.desktop
echo "Name=WhatsApp" >> /home/$USER/.local/share/applications/whatsapp.desktop
#echo "Exec=env WINEPREFIX=\"/home/$USER/.wine/whatsapp\" WINEARCH=win32 wine C:\\\\\\\\windows\\\\\\\\command\\\\\\\\start.exe /Unix \"/home/$USER/.wine/whatsapp/drive_c/whatsapp/WhatsApp.exe\"" >> /home/$USER/.local/share/applications/wine-whatsapp.desktop
echo "Exec=env WINEPREFIX=\"/home/$USER/.wine/whatsapp\" WINEARCH=win32 wine C:\\\\\\\\whatsapp\\\\\\\\WhatsApp.exe" >> /home/$USER/.local/share/applications/whatsapp.desktop
echo "StartupNotify=true" >> /home/$USER/.local/share/applications/whatsapp.desktop
echo "Terminal=false" >> /home/$USER/.local/share/applications/whatsapp.desktop
echo "X-KeepTerminal=false" >> /home/$USER/.local/share/applications/whatsapp.desktop
#echo "Icon=/home/$USER/$winePrefixName/drive_c/users/$USER/Application Data/WhatsApp/app.ico" >> /home/$USER/.local/share/applications/wine-whatsapp.desktop
echo "Name[en_US]=WhatsApp" >> /home/$USER/.local/share/applications/whatsapp.desktop
echo "StartupWMClass=WhatsApp.exe" >> /home/$USER/.local/share/applications/whatsapp.desktop
chmod +x /home/$USER/.local/share/applications/whatsapp.desktop
