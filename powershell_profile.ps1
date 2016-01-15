# Load posh-git example profile
. '~\Documents\WindowsPowerShell\Modules\posh-git\profile.example.ps1'

# Colours
Import-Module PSColors

# ReadLine
Import-Module PSReadline
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadlineKeyHandler -Key Ctrl+D -Function DeleteCharOrExit
