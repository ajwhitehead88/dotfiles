function mklink { cmd /c mklink $args }
function editconflicts { git diff --name-only | Sort-Object -Unique | % { gvim $_ } }
function cleanbranches { git branch --merged | %{$_.trim()} | ?{$_ -notmatch 'develop' -and $_ -notmatch 'master'} | %{git branch -d $_} }
