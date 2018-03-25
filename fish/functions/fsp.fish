# switch aws profile
function fsp
  cat ~/.aws/credentials \
    | grep -v "^#" \
    | grep "^\[" \
    | sed "s/\[\(.*\)\]/\1/g" \
    | fzf +m \
    | read -l aws_profile

  if test -z "$aws_profile"
    echo "Please choose aws profile..."; and return
  end

  eval (spin "env AWS_PROFILE=$aws_profile aswrap" | source); \
    and echo "AWS credentials has stored!!"
end
