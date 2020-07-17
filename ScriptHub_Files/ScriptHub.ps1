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

#$error = 0
$updateError = 0

#Set verison file directory
$VersionDir = '.\version'

#Check if version file exists
if (Test-Path $VersionDir -PathType leaf)
{
$Version = Get-Content -Path $VersionDir
} else
{
$Version = "Unkown"
}


function Get-ScriptDirectory {
    Split-Path -parent $PSCommandPath
}

#cls

Function Start-ScriptHub{

#Get the script location
$localLocation = Get-ScriptDirectory

#Set the location
Set-Location $localLocation

#cls

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

#Has to wait or color won't be green - No idea why !!Only in ISE!!
Start-Sleep -mill 10

Write-Host "Version: $($version)" -Fore Green
Write-Host "Created by HelpMeGame with help from SCR33M `n" -fore Green

echo 'Where Would You Like To Go? (Type The Number Of Where You Would Like To Go To)
1) Background
2) Dark Mode
3) Update Log
4) Shortcuts
5) Update
'

$Select = Read-Host

if ($Select -eq '1')
{
    & .\SetBackground\Background.ps1
} elseif($Select -eq '2')
    {
    & .\Darkmode\Darkmode.ps1
    } elseif($Select -eq '3')
        {
        & .\UpdateLog.txt
        Start-ScriptHub
        } elseif($Select -eq '4')
            {
            & .\Shortcuts\Shortcuts.ps1
            } elseif($Select -eq '5')
                {
                & .\Update\Update.ps1
                } elseif ($Select -eq 'Incognito')
                    {
                    & .\Incognito\Incognito.ps1
                    } else
                        {
                        cls
                        $error = 1
                        Start-ScriptHub
                        }
}

cls
Start-ScriptHub
