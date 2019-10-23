Set-PSReadlineKeyHandler -Key Tab -Function Complete

# We need posh-git to be installed
if (! (get-module -ListAvailable posh-git)) 
{
    echo "posth-git not found, installing"
    Install-Module posh-git -Scope CurrentUser
}

# cmder load posh-git for us, don't mess with it
if (! $Env:CMDER_ROOT) 
{
    Import-Module posh-git
}

# git for windows comes with Cmder
if ($Env:CMDER_ROOT) {
    $env:Path += ";$Env:CMDER_ROOT\vendor\git-for-windows\usr\bin"
}

$script:MachineProfileDir = (get-item $PROFILE).Directory.FullName + "\machine_profile.ps1"

if (Test-Path $script:MachineProfileDir)
{
    . $script:MachineProfileDir
}
