function mklink {
    cmd /c mklink $args
}
function Edit-Conflicts {
    git diff --name-only
    | Sort-Object -Unique
    | ForEach-Object { gvim $_ }
}
function Remove-Branches {
    git branch --merged
    | ForEach-Object { $_.trim() }
    | Where-Object { $_ -notmatch 'develop' -and $_ -notmatch 'master' -and $_ -notmatch '^\*' }
    | ForEach-Object { git branch -d $_ }
}