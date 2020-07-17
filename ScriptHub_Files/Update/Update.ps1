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

#Get the script directory
$CurrentDir = $PSScriptRoot

#Set the directory
Set-Location $CurrentDir

#Go up in directory
$MainDir = Split-Path -Path $CurrentDir -Parent

#Set verison file directory
$VersionDir = "$($MainDir)\version"

#Check if version file exists
if (Test-Path $VersionDir -PathType leaf)
{
$Version = Get-Content -Path $VersionDir
} else
{
$Version = "Unkown"
}

function CheckForUpdate {
    cls

    #Sets script dir
    Set-Location $CurrentDir

    #Set the uri for the latest release
    $URI = "https://api.github.com/repos/HelpMeGame/ScriptHub/releases/latest"

    #Gets latest release tag
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    $ReleaseTag = (Invoke-WebRequest -Uri $URI -UseBasicParsing | ConvertFrom-Json)[0].tag_name
    
    if ($ReleaseTag -gt $Version) {
        Write-Host "New version available! Would you like to update?"
        $YN = Read-Host “[Y] Yes [N] No”
        if ($YN -eq 'y' -or $YN -eq 'Y') {
            Update
        } elseif ($YN -eq 'n' -or $YN -eq 'N') {
            & .\Update.ps1
        } else {
            & .\Update.ps1
        }
    } else
    {
        Write-Host "Latest Update [$($ReleaseTag)] already installed!"
        read-host “Press ENTER to continue...”
        & .\Update.ps1
    }
}

function Update {
    cls
    write-host "Downloading..."
    #Query the API to get the url of the zip
    $Response = Invoke-RestMethod -Method Get -Uri $URI
    $ZipUrl = $Response.zipball_url

    #Download the file to the current location
    $OutputPath = "$((Get-Location).Path)\$($Response.name.Replace(" ","_")).zip"
    invoke-RestMethod -Method Get -Uri $ZipUrl -OutFile $OutputPath

    $temp = "C:\users\$env:username\AppData\local\temp"

    #Copy update to temp
    Copy-Item -path $CurrentDir\ScriptHub_$ReleaseTag.zip -destination $temp
    Remove-Item -path $CurrentDir\ScriptHub_$ReleaseTag.zip

    
    cls 
    write-host "Extracting..."

    #extract
    expand-archive -Path $temp\ScriptHub_$ReleaseTag.zip -destination $temp\ScriptHub_Temp
    Remove-Item -path $temp\ScriptHub_$ReleaseTag.zip

    cls
    write-host "Installing..."

    $filename = Get-ChildItem -Path $temp\ScriptHub_Temp\
    $StartDir = Split-Path -Path $MainDir -Parent

    #copy over
    Remove-Item -Path $StartDir/* -Force
    Copy-Item -Recurse -force "$temp\ScriptHub_Temp\$filename\*" -Destination $CurrentDir
    Remove-Item -path $temp\ScriptHub_Temp
    
}

cls

Write-Host "
#     #                                   
#     # #####  #####    ##   ##### ###### 
#     # #    # #    #  #  #    #   #      
#     # #    # #    # #    #   #   #####  
#     # #####  #    # ######   #   #      
#     # #      #    # #    #   #   #      
 #####  #      #####  #    #   #   ###### 
"
#Has to wait or color won't be green - No idea why !!Only in ISE!!
Start-Sleep -mill 10

Write-Host "Developed by SCR33M, Improved By HelpMeGame " -fore Green
Write-Host "Version: $($version)" -fore Green

echo '
Type the number of the action you would like to do.
1) Check for and install updates
2) Revert Versions -- Currently Under Construction
3) Return To ScriptHub
'

#read numbers typed
$Select = Read-Host

#Elif hell
if ($Select -eq '1')
    {
        CheckForUpdate
    } elseif ($Select -eq '2') 
        {
            & .\Update.ps1
        } elseif ($Select -eq '3')
            {
            &..\ScriptHub.ps1
            } elseif ($Select -ne 1 -and 2 -and 3)
                {
                & .\Update.ps1
                }


