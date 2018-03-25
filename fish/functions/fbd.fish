# delete git branches
function fco
  git branch -vv | fzf +m | read -l branch
  git branch -d (echo "$branch" | awk '{print $1}' | sed "s/.* //")
end
