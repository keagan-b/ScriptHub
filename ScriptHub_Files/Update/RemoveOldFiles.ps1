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

$oldVersion = Get-Content -Path .\currentUpdaterVersion.txt
$oldversion = $oldversion -0.1
$currentVersion = 1.9

function Get-ScriptDirectory {
    Split-Path -parent $PSCommandPath
}

#Get the script location
$localLocation = Get-ScriptDirectory

#Set the location
Set-Location $localLocation
Set-Content -Path .\currentUpdaterVersion.txt $currentVersion
Remove-Item -Path ..\..\..\Scripthub -Recurse
Remove-Item -Path ..\..\..\Scripthub_$oldVersion -Recurse
Remove-Item -Path .\CopyOverUpdate.ps1
Remove-Item -Path .\RemoveOldFiles.ps1
Remove-Item -Path .\Update.ps1
Remove-Item -Path .\NewUpdate.txt
Remove-Item -Path .\CurrentUpdaterVersion.txt
& ..\ScriptHub.ps1