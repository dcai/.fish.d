# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# ! conf.d/* are loaded before config.fish !
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

set -x FISHHOME "$HOME/.config/fish"

switch (uname)
	case Linux
		source_script $FISHHOME/dialect/linux.fish;
	case Darwin
		source_script $FISHHOME/dialect/macos.fish;
		source_script $FISHHOME/dialect/iterm2.fish;
	#case FreeBSD NetBSD DragonFly
	#case '*'
end

add_paths \
  /usr/local/share/npm/bin \
  /usr/local/sbin \
  /usr/local/bin \
  ~/Dropbox/bin \
  ~/.local/bin \
  ~/.cabal/bin \
  ~/.fzf/bin \
  ~/.npm-packages/bin \
  ~/.composer/vendor/bin \
  ~/Library/Python/2.7/bin \
  ~/Library/Python/3.5/bin \
  ~/Library/Python/3.6/bin \
  "$GOPATH/bin"

if type --quiet "ruby"
  set -l RUBYGEMHOME (ruby -rubygems -e 'puts Gem.user_dir')
  add_one_path "$RUBYGEMHOME/bin"
end
