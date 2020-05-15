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
function Get-ScriptDirectory {
    Split-Path -parent $PSCommandPath
}
#Get the script location
$localLocation = Get-ScriptDirectory

#Set the location
Set-Location $localLocation
cls
Function ChangeLightMode{
echo "
######                          #     #                      
#     #   ##   #####  #    #    ##   ##  ####  #####  ###### 
#     #  #  #  #    # #   #     # # # # #    # #    # #      
#     # #    # #    # ####      #  #  # #    # #    # #####  
#     # ###### #####  #  #      #     # #    # #    # #      
#     # #    # #   #  #   #     #     # #    # #    # #      
######  #    # #    # #    #    #     #  ####  #####  ###### 
"
Write-Host "Created By HelpMeGame" -fore Green
Write-Host "The following are your avalible actions;"
echo '1) Enable Dark Mode
2) Disable Dark Mode
3) Return To ScriptHub'

$able = Read-Host

if ($able -eq 1)
{
 Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme -Value 0
 & ..\ScriptHub.ps1
}
else
{
 if ($able -eq 2)
 {
  Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme -Value 1
  & ..\ScriptHub.ps1
 }
 else
 {
 if ($able -eq 3)
 {
    & ..\ScriptHub.ps1
 }
 else
 {
 cls
 Write-Host 'Error, That is not a valid response.'
 ChangeLightMode
 }
}
}
}

ChangeLightMode