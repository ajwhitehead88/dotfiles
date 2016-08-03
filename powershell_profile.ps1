Push-Location (Split-Path -Path $MyInvocation.MyCommand.Definition -Parent)

# Load posh-git module from current directory
Import-Module posh-git

# Set up a simple prompt, adding the git prompt parts inside git repos
function global:prompt {
    $realLASTEXITCODE = $LASTEXITCODE

    Write-Host($pwd.ProviderPath) -nonewline

    Write-VcsStatus

    $global:LASTEXITCODE = $realLASTEXITCODE
    return "> "
}

# Colours
Import-Module PSColors

# Tab Expansion
Import-Module TabExpansionPlusPlus

# ReadLine
Import-Module PSReadline

Set-PSReadlineOption -EditMode Emacs
Set-PSReadlineOption -BellStyle Visual

Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadlineKeyHandler -Key Ctrl+D -Function DeleteCharOrExit

function mklink { cmd /c mklink $args }

Pop-Location
