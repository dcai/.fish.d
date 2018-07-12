function fish_prompt
  # test $SSH_TTY
  # and printf (set_color red)$USER(set_color brwhite)'@'(set_color yellow)(prompt_hostname)' '
  switch "$USER"
    case root
      echo -n (set_color red)(prompt_pwd) "# "
    case '*'
      echo -n (set_color cyan)(prompt_pwd) (set_color green)'> '
  end
  set_color normal
end
