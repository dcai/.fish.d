# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# ! conf.d/* are loaded before config.fish
# https://github.com/fish-shell/fish-shell/issues/3099
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

set -x FISHHOME "$HOME/.config/fish"
set fish_greeting

switch (uname)
    case Linux
        source_script $FISHHOME/dialect/linux.fish
    case Darwin
        source_script $FISHHOME/dialect/macos.fish
        #case FreeBSD NetBSD DragonFly
        #case '*'
end
# starship init fish | source
