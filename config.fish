# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# ! conf.d/* are loaded before config.fish !
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

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
  /snap/bin \
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
  ~/Library/Python/2.7/bin \
  ~/Library/Python/3.6/bin \
  ~/Library/Python/3.7/bin \
  ~/Library/Python/3.8/bin \
  "$GOPATH/bin"

if type --quiet "ruby"
  set -l RUBYGEMHOME (ruby -r rubygems -e "puts Gem.user_dir")
  add_one_path "$RUBYGEMHOME/bin"
end

set -U fish_path ~/.local/share/fisherman

for file in $fish_path/conf.d/*.fish
  builtin source $file 2> /dev/null
end

set fish_function_path $fish_path/functions $fish_function_path
set fish_complete_path $fish_path/completions $fish_complete_path
