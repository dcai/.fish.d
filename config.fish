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
  /usr/lib/go-1.9/bin \
  /usr/local/bin \
  /usr/local/sbin \
  /usr/local/share/npm/bin \
  ~/.cabal/bin \
  ~/.composer/vendor/bin \
  ~/.fzf/bin \
  ~/.local/bin \
  ~/.npm-packages/bin \
  ~/Dropbox/bin \
  ~/Library/Python/2.7/bin \
  ~/Library/Python/3.5/bin \
  ~/Library/Python/3.6/bin \
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
