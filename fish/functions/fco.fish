# change git branches
function fco
  git branch -vv | fzf +m | read -l branch
  git checkout (echo "$branch" | awk '{print $1}' | sed "s/.* //")
end
