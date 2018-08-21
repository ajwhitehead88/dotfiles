function mklink { cmd /c mklink $args }
function Edit-Conflicts { git diff --name-only | Sort-Object -Unique | % { gvim $_ } }
function Clean-Branches { git branch --merged | %{$_.trim()} | ?{$_ -notmatch 'develop' -and $_ -notmatch 'master' -and $_ -notmatch '^*'} | %{git branch -d $_} }
