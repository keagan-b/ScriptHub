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

Function Find-CustomShortcuts{
    Get-ChildItem ".\CustomShortcuts" -Name
    Foreach-Object {

}
}

Function StartShortcuts {
echo "
 #####                                                        
#     # #    #  ####  #####  #####  ####  #    # #####  ####  
#       #    # #    # #    #   #   #    # #    #   #   #      
 #####  ###### #    # #    #   #   #      #    #   #    ####  
      # #    # #    # #####    #   #      #    #   #        # 
#     # #    # #    # #   #    #   #    # #    #   #   #    # 
 #####  #    #  ####  #    #   #    ####   ####    #    ####  
                                                              "

Write-Host 'The following names are the avalible shortcuts.' -fore Green
echo '-----------------------------------------------------------'
Find-CustomShortcuts
echo '-----------------------------------------------------------'
Write-Host "Type the name of the shortcut to run it. (Do not include the '.ps1' at the end)
Your Other Actions Are;
1) Create Shortcut
2) Delete Shortcut
3) Rename Shortcut
4) Return To Sctipthub"
$goto = Read-Host
if ($goto -eq '1')
{
    echo "Type the new shortcut name. To return to the main menu, type 'return.'"
    $createShortcutName = Read-Host
    if ($createShortcutName -eq 'return')
    {
        & .\Shortcuts.ps1
    }
    else
    {
        echo "Type the shortcut application. The following are avalible apps;
Chrome,
Internet Explorer (use 'Iexplore')
**More Shortcuts to come later**
"
$createShortcutApp = Read-Host
        if ($createShortcutApp -eq 'chrome' -or 'iexplore')
        {
        echo "Please enter the URL for the shortcut"
        $createShortcutURL = Read-Host 
        }
    }
    $ps1name = $createShortcutName + '.ps1'
    $newCommand = "Start-Process $createShortcutApp $createShortcutURL"
    New-Item -Path .\CustomShortcuts -Name $ps1name
    Set-Content -Path .\CustomShortcuts\$ps1name $newCommand
    & .\Shortcuts.ps1
}
else
{
    if ($goto -eq '2')
    {
        cls
        Write-Host "The following are all your shortcuts;"
        echo '-----------------------------------------------------------'
        Find-CustomShortcuts
        echo '-----------------------------------------------------------'
        echo 'To delete a file, type the file name. If you wish to return, typing something other than a file name will return you to the main menu'
        $toDelete = Read-Host
        $toDelete = $toDelete + '.ps1'
        Remove-Item .\CustomShortcuts\$toDelete
        & .\Shortcuts.ps1
    }
    else
    {
        if ($goto -eq '4') 
        {
        & ..\ScriptHub.ps1
        }
        elseif ($goto -eq '3') 
        {
            cls
            Write-Host "The following are all your shortcuts;"
            echo '-----------------------------------------------------------'
            Find-CustomShortcuts
            echo '-----------------------------------------------------------'
            echo 'To rename a file, type the file name. If you wish to return, typing 'return' will return you to the main menu'
            $toRename = Read-Host
            if ($toRename -eq 'return')
            {
                cls
                StartShortcuts
            }
            else
            {
            $toRename = $toRename + '.ps1'
            cls
            echo 'What would you like to name it?'
            $newName = Read-Host
            $newName = $newName + '.ps1'
            Rename-Item  -Path .\CustomShortcuts\$toRename -NewName $newName
            & .\Shortcuts.ps1
            }
        }
        else
        {
            $goto = $goto + '.ps1'
            & .\CustomShortcuts\$goto
            cls
            Write-Host "File should have opened. If not, please check the spelling and try agian."
            StartShortcuts
        }
    }
}
& ..\ScriptHub.ps1
}
cls
StartShortcuts