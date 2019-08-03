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
  ~/.config/composer/vendor/bin \
  ~/.fzf/bin \
  ~/.local/bin \
  ~/.npm-packages/bin \
  ~/Dropbox/bin \
  ~/Library/Python/2.7/bin \
  ~/Library/Python/3.5/bin \
  ~/Library/Python/3.6/bin \
  ~/Library/Python/3.7/bin \
  /usr/local/opt/node@10/bin \
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

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/dcai/.npm-packages/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.fish ]; and . /Users/dcai/.npm-packages/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.fish
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/dcai/.npm-packages/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.fish ]; and . /Users/dcai/.npm-packages/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.fish
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[ -f /Users/dcai/.npm-packages/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.fish ]; and . /Users/dcai/.npm-packages/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.fish
