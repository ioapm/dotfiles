function fzf_ssh
  awk '
    tolower($1)=="host" {
      for(i=2;i<=NF; i++) {
        if ($i !~ "[*?]") {
          print $i
        }
      }
    }
  ' ~/.ssh/config | sort | fzf | read -l hostname
  if test -n "$hostname"
    ssh $hostname
  end
end

alias s "fzf_ssh"
