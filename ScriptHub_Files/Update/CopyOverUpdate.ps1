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

$currentVersion = Get-Content -Path .\currentUpdaterVersion.txt
$newVersion = Get-Content -Path .\NewUpdate.txt

#Set the location
Set-Location $localLocation
function Hold {
Write-Host "Please Hold. Copying Files Now."
New-Item -Type Directory -Path ..\..\..\ -Name ScriptHub_$newVersion
Copy-Item -Path .\* -Destination ..\..\..\ScriptHub_$newVersion -Recurse
& ..\..\ScriptHub_$newVersion\Update\RemoveOldFiles.ps1
}
Hold