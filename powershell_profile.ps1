Push-Location (Split-Path -Path $MyInvocation.MyCommand.Definition -Parent)

# Set the encoding
[Console]::OutputEncoding = [Text.UTF8Encoding]::UTF8

# Load posh-git module from current directory
Import-Module posh-git

# Set up a simple prompt, adding the git prompt parts inside git repos
function global:prompt {
    $realLASTEXITCODE = $LASTEXITCODE

    Write-Host($pwd.ProviderPath) -nonewline

    Write-VcsStatus

    $global:LASTEXITCODE = $realLASTEXITCODE

    if ( $realLASTEXITCODE -eq 0 )
    {
        Write-Host ">" -NoNewline -ForegroundColor Green
    }
    else
    {
        Write-Host ">" -NoNewline -ForegroundColor Red
    }

    return " "
}

# Start agent
$keys = Get-ChildItem $HOME\.ssh\*.ppk | Select -ExpandProperty FullName
if ( $keys ) {
    pageant.exe $keys
}

# Colours
# Import-Module PSColors

# Tab Expansion
# Import-Module TabExpansionPlusPlus

# ReadLine
Import-Module PSReadline

Set-PSReadlineOption -EditMode Emacs
Set-PSReadlineOption -BellStyle Visual

Set-PSReadlineKeyHandler -Key Ctrl+Shift+LeftArrow -Function SelectShellBackwardWord
Set-PSReadlineKeyHandler -Key Ctrl+Shift+RightArrow -Function SelectShellForwardWord
Set-PSReadlineKeyHandler -Key Ctrl+LeftArrow -Function ShellBackwardWord
Set-PSReadlineKeyHandler -Key Ctrl+RightArrow -Function ShellForwardWord
Set-PSReadlineKeyHandler -Key Ctrl+Backspace -Function ShellBackwardKillWord
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadlineKeyHandler -Key Ctrl+D -Function DeleteCharOrExit

Pop-Location
