#----------------------------------------------------#
#    _____           _       _   _    _       _      #
#   / ____|         (_)     | | | |  | |     | |     #
#  | (___   ___ _ __ _ _ __ | |_| |__| |_   _| |__   #
#   \___ \ / __| '__| | '_ \| __|  __  | | | | '_ \  #
#   ____) | (__| |  | | |_) | |_| |  | | |_| | |_) | #
#  |_____/ \___|_|  |_| .__/ \__|_|  |_|\__,_|_.__/  #
#                     | |                            #
#                     |_|                            #
#----------------------------------------------------#

#Set Get-FileName Function
Function Get-FileName($initialDirectory)
{   
 [System.Reflection.Assembly]::LoadWithPartialName(“System.windows.forms”) |
 Out-Null

 $OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
 $OpenFileDialog.initialDirectory = $initialDirector
 $OpenFileDialog.filter = “All Files (*.*)| *.*”
 $OpenFileDialog.ShowDialog() | Out-Null
 $OpenFileDialog.filename
}

function Get-ScriptDirectory {
    Split-Path -parent $PSCommandPath
}

#Clear command prompt
cls

function StartBackground {

Write-Host "
######                                                                 
#     #   ##    ####  #    #  ####  #####   ####  #    # #    # #####  
#     #  #  #  #    # #   #  #    # #    # #    # #    # ##   # #    # 
######  #    # #      ####   #      #    # #    # #    # # #  # #    # 
#     # ###### #      #  #   #  ### #####  #    # #    # #  # # #    # 
#     # #    # #    # #   #  #    # #   #  #    # #    # #   ## #    # 
######  #    #  ####  #    #  ####  #    #  ####   ####  #    # #####  "

Write-Host "Created By HelpMeGame and improved by SCR33M" -fore Green

#Replace Background or Reset Background?
Write-Host "The following are your avalible options;"  -fore Green 
echo '1) Set Background
2) Reset Background
3) Return to ScriptHub'
Write-Host 'If you are setting the background, do not delete ScriptHub without reseting it!' -fore Red

$replace = Read-Host 

#If replace 1 continue
if ($replace -eq 1){


    #Set Image To Null
    $Image = 'null'

    #Get Image
    $Image = Get-FileName -initialDirectory “c:fso”

    #Test if image is real or not.
    $RealImage = Test-Path $Image -PathType Leaf

    cls
   
    #Remove the OTHER FILES
    Remove-Item "C:\Users\$env:username\AppData\Roaming\Microsoft\Windows\Themes" -Recurse
   
    #Set The Cache Folder
    New-Item -Path "C:\Users\$env:username\AppData\Roaming\Microsoft\Windows\Themes\" -Name "CachedFiles" -ItemType "Directory"


    #Copy the image to the file
    Copy-Item -Path $Image -Destination "C:\Users\$env:username\AppData\Roaming\Microsoft\Windows\Themes\TranscodedWallpaper"
    Copy-Item -Path $Image -Destination "C:\Users\$env:username\AppData\Roaming\Microsoft\Windows\Themes\CachedFiles\CachedImage_1366_768_POS4.jpg"

    #Update files
    rundll32.exe user32.dll, UpdatePerUserSystemParameters
    rundll32.exe user32.dll, UpdatePerUserSystemParameters
    Get-ItemProperty -path 'HKCU:\Control Panel\Desktop' | Select -Property WallPaper

    #Clear the prompt
    cls

    #Return to ScriptHub
    & ..\ScriptHub.ps1
    }
    
else
{
if ($replace -eq 2){
    #Remove The Current Background
    Remove-Item "C:\Users\$env:username\AppData\Roaming\Microsoft\Windows\Themes" -Recurse

    #Add the old backgrounds
    Copy-Item -Path '.\Themes' -Destination "C:\Users\$env:username\AppData\Roaming\Microsoft\Windows\"

    #Update The Background
    rundll32.exe user32.dll, UpdatePerUserSystemParameters
    rundll32.exe user32.dll, UpdatePerUserSystemParameters
    Get-ItemProperty -path 'HKCU:\Control Panel\Desktop' | Select -Property WallPaper

    #Clear the prompt
    cls

    #Return to ScriptHub
    & ..\ScriptHub.ps1
}
else
{
    if ($replace -eq '3')
    {
        & ..\Scripthub.ps1
    }
    else
    {
    cls
    Write-Host "You have typed something that is not 'Return', '1', or '2'. Please type one of these options." -fore red
    StartBackground
    }
}
}
}
#Get the script location
$localLocation = Get-ScriptDirectory

#Set the location
Set-Location $localLocation
cls
StartBackground