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

$error = 0
$updateError = 0

function Get-ScriptDirectory {
    Split-Path -parent $PSCommandPath
}
cls
Function Start-ScriptHub{
#Get the script location
$localLocation = Get-ScriptDirectory

#Set the location
Set-Location $localLocation

cls

if ($error -eq '1')
{
Write-Host 'Error, Not A Valid Response.' -fore Red
}

Write-Host "
 #####                               #     #               
#     #  ####  #####  # #####  ##### #     # #    # #####  
#       #    # #    # # #    #   #   #     # #    # #    # 
 #####  #      #    # # #    #   #   ####### #    # #####  
      # #      #####  # #####    #   #     # #    # #    # 
#     # #    # #   #  # #        #   #     # #    # #    # 
 #####   ####  #    # # #        #   #     #  ####  #####
"

Write-Host 'Version 1.9' -fore Green
Write-Host 'Created by HelpMeGame with help from SCR33M' -fore Green
echo 'Where Would You Like To Go? (Type The Number Of Where You Would Like To Go To)
1) Background,
2) Dark Mode,
3) Update Log,
4) Shortcuts,
5) Update
'
$launch = Read-Host

if ($launch -eq '1')
{
    & .\SetBackground\Background.ps1
}
else
{
    if($launch -eq '2')
    {
       & .\Darkmode\Darkmode.ps1
    }
    else
    {
        if($launch -eq '3')
        {
        & .\UpdateLog.txt
        Start-ScriptHub
        }
        else
        {
            if($launch -eq '4')
            {
            & .\Shortcuts\Shortcuts.ps1
            }
            else
            {
                if($launch -eq '5')
                {
                &.\Update\Update.ps1
                }
                else
                {
                    if ($launch -eq 'Incognito')
                    {
                    & .\Incognito\Incognito.ps1
                    }
                    else
                    {
                        cls
                        $error = 1
                        Start-ScriptHub
                    }
                }
            }
        }
    }
}
}
cls
Start-ScriptHub
