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

add_paths \
  /usr/local/bin \
  /usr/local/sbin \
  /usr/local/share/npm/bin \
  ~/Dropbox/bin \
  ~/.bin \
  ~/.cabal/bin \
  ~/.config/composer/vendor/bin \
  ~/.fzf/bin \
  ~/.gem/ruby/2.7.0/bin \
  ~/.krew/bin \
  ~/.local/bin \
  ~/.npm-packages/bin \
  "$GOPATH/bin"

# if type --quiet "ruby"
#   set -l RUBYGEMHOME (ruby -r rubygems -e "puts Gem.user_dir")
#   add_one_path "$RUBYGEMHOME/bin"
# end

set -U fish_path ~/.local/share/fisherman

set fish_function_path $fish_path/functions $fish_function_path
set fish_complete_path $fish_path/completions $fish_complete_path
# starship init fish | source
