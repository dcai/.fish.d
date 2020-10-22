# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# ! conf.d/* are loaded before config.fish
# https://github.com/fish-shell/fish-shell/issues/3099
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

set -x FISHHOME "$HOME/.config/fish"
set fish_greeting

switch (uname)
case Linux
  source_script $FISHHOME/dialect/linux.fish;
case Darwin
  source_script $FISHHOME/dialect/macos.fish;
#case FreeBSD NetBSD DragonFly
#case '*'
end

set -U fish_path ~/.local/share/fisherman

set fish_function_path $fish_path/functions $fish_function_path
set fish_complete_path $fish_path/completions $fish_complete_path
# starship init fish | source
