function fish_user_key_bindings
  fzf_key_bindings
  bind \co 'one |  read -lz result; and commandline -- $result; commandline -f repaint'
end
