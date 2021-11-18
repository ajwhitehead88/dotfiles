Push-Location (Split-Path -Path $MyInvocation.MyCommand.Definition -Parent)

# Set the encoding
[Console]::OutputEncoding = [Text.UTF8Encoding]::UTF8

# Load posh-git module from current directory
Import-Module posh-git

$GitPromptSettings.DefaultPromptAbbreviateHomeDirectory = $true
$GitPromptSettings.DefaultPromptPath.ForegroundColor = 'Orange'

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
