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
  /usr/lib/go-1.9/bin \
  /usr/local/bin \
  /usr/local/opt/node@10/bin \
  /usr/local/sbin \
  /usr/local/share/npm/bin \
  ~/Dropbox/bin \
  ~/.bin \
  ~/.cabal/bin \
  ~/.composer/vendor/bin \
  ~/.config/composer/vendor/bin \
  ~/.fzf/bin \
  ~/.krew/bin \
  ~/.local/bin \
  ~/.npm-packages/bin \
  "$GOPATH/bin"

if type --quiet "ruby"
  set -l RUBYGEMHOME (ruby -r rubygems -e "puts Gem.user_dir")
  add_one_path "$RUBYGEMHOME/bin"
end

set -U fish_path ~/.local/share/fisherman

set fish_function_path $fish_path/functions $fish_function_path
set fish_complete_path $fish_path/completions $fish_complete_path


[ -f $HOME/.asdf/asdf.fish ]; and . $HOME/.asdf/asdf.fish
