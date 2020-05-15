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
$verison = 1.9
#Get the script location
$localLocation = Get-ScriptDirectory

#Set the location
Set-Location $localLocation
$CurrentLocation = G

function update {
    Set-Location $localLocation
    # --- Set the uri for the latest release
    $URI = "https://api.github.com/repos/HelpMeGame/ScriptHub/releases/latest"

    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    $tag = (Invoke-WebRequest -Uri $URI -UseBasicParsing | ConvertFrom-Json)[0].tag_name

    $tag2 = $tag
    $versionTag = $version -0.1

    if ($tag2 -ne 'v'+$versionTag) {
        # --- Query the API to get the url of the zip
        $Response = Invoke-RestMethod -Method Get -Uri $URI
        $ZipUrl = $Response.zipball_url

         # --- Download the file to the current location
        $OutputPath = "$((Get-Location).Path)\$($Response.name.Replace(" ","_")).zip"
        Invoke-RestMethod -Method Get -Uri $ZipUrl -OutFile $OutputPath



        expand-archive -Path $outputpath
        Remove-Item -path $OutputPath


        $local = get-location

        $filename = Get-ChildItem -Path $local'\ScriptHub_'$tag

        Copy-Item -Recurse -force "$local\ScriptHub_$tag\$filename\*" -Destination $local
        Remove-Item $local'\ScriptHub_'$tag -Force -Recurse

        } 
        else 
        {
        write-host 'You are running the latest version!'
        }

    Set-Content -Value $tag2 -Path .\NewUpdate.txt

    & .\CopyOverUpdate.ps1
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
Write-Host "Developed by SCR33M, Improved By HelpMeGame" -fore Green
echo ''
Write-Host 'Current Version:' $verison
echo '
Type the number of the action you would like to do.
1) Check for and install updates
2) Revert Versions -- Currently Under Construction
3) Return To ScriptHub
'
$goto = Read-Host

if ($goto -eq '1')
    {
        update
    }
    elseif ($goto -eq '3') 
        {
            & .\Update.ps1
        }
        elseif ($goto -eq '2')
        {
            &..\ScriptHub.ps1
        }
            elseif ($goto -ne 1 -and 2 -and 3)
            {
                & .\Update.ps1
            }


