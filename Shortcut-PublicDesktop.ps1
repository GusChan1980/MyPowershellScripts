#GAI - 1.0
#Creates shortcut on the public desktop for all users. Also sets custom icon file if desired. 
#Create an icon file with convertto-icon.ps1 or https://convertio.co/jpg-ico/
#Make the target path the URL you want to use, and comment out or delete the $Shortcut.Arguments line. 

#Create directory to hold icon file and copy file there
New-Item -Path "C:\CCMScripts\intune" -Name "ServicePortal" -ItemType "directory" -Force
Copy-Item ".\SMAX.ico" -Destination "C:\CCMScripts\intune\ServicePortal\SMAX.ico" 

#Shortcut creation and specify settings
$Shell = New-Object -ComObject ("WScript.Shell")
$ShortCut = $Shell.CreateShortcut("C:\users\public\desktop\ServicePortal.lnk")
$Shortcut.Arguments="https://prosegur-smartit.onbmc.com/smartit/app/#/ticket-console"
$ShortCut.IconLocation = "C:\CCMScripts\intune\ServicePortal\SMAX.ico";
$ShortCut.Description = "Service Portal";
$ShortCut.Save()

#Shortcut creation and specify settings Start Menu
$WshShell = New-Object -ComObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Service Portal.url")
$Shortcut.TargetPath = "https://prosegur-smartit.onbmc.com/smartit/app/#/ticket-console"
$Shortcut.Save()
