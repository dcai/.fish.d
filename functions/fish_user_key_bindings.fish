function fzf-oneliners-widget -d "Show oneliners"
  set -q FZF_TMUX_HEIGHT; or set FZF_TMUX_HEIGHT 40%
  begin
    set -lx FZF_DEFAULT_OPTS "--height $FZF_TMUX_HEIGHT $FZF_DEFAULT_OPTS"
    # (commandline) read current line content
    one | eval fzf -q '(commandline)' | read -l result
    and commandline -- $result
  end
  commandline -f repaint
end
function fish_user_key_bindings
  fzf_key_bindings
  bind \co fzf-oneliners-widget
end
