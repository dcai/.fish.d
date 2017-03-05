set -x FISHHOME "$HOME/.config/fish"

function source_script
  test -f $argv[1]; and source $argv[1]
end

function add_one_path --description 'Add a directory to $PATH'
  set -l added 0
  for path in $PATH;
    if test $path = $argv[1]
      set -l added 1
    end
  end;
  # only add $argv[1] when it's not yet in $PATH
  if test 0 -eq $added
    test -d $argv[1]; and set PATH $argv[1] $PATH
    #test -d $argv[1]; and set fish_user_paths $argv[1] $fish_user_paths
  end;
end

function add_paths --description 'Add a list of paths to $PATH'
  for p in $argv
    add_one_path $p
  end
end

switch (uname)
	case Linux
		source_script $FISHHOME/fish.d/linux.fish;
	case Darwin
		source_script $FISHHOME/fish.d/macos.fish;
		source_script $FISHHOME/fish.d/iterm2.fish;
	#case FreeBSD NetBSD DragonFly
	#case '*'
end

source_script $FISHHOME/fish.d/00-env.fish
source_script $FISHHOME/fish.d/20-local.fish
source_script $FISHHOME/fish.d/80-credentials.fish
source_script $FISHHOME/fish.d/learnosity.fish;

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

#if type --quiet "brew"
  #add_one_path (brew --prefix)"/bin"
#end

if type --quiet "ruby"
  set -l RUBYGEMHOME (ruby -rubygems -e 'puts Gem.user_dir')
  add_one_path "$RUBYGEMHOME/bin"
end
