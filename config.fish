set -x FISHHOME "$HOME/.config/fish"

function source_script
  test -f $argv[1]; and source $argv[1]
end

function add_one_path --description 'Add a directory to $PATH'
  test -d $argv[1]; and set PATH $argv[1] $PATH
end

function add_paths --description 'Add a list of paths to $PATH'
  for p in $argv
    add_one_path $p
  end
end

source_script $FISHHOME/00-env.fish
source_script $FISHHOME/20-local.fish
source_script $FISHHOME/80-credentials.fish

add_paths \
  /usr/local/share/npm/bin \
  /usr/local/sbin \
  /usr/local/bin \
  ~/.cabal/bin \
  ~/Dropbox/bin \
  ~/.npm-packages/bin \
  ~/.composer/vendor/bin \
  ~/Library/Python/3.5/bin \
  "$GOPATH/bin" \
  ~/.phpenv/bin \
  ~/Library/Python/2.7/bin

if type --quiet "brew"
  add_one_path ""(brew --prefix)"/bin"
end

if type --quiet "ruby"
  add_one_path ""(ruby -rubygems -e 'puts Gem.user_dir')"/bin"
end

source_script $FISHHOME/learnosity.fish;
source_script $FISHHOME/iterm2.fish;
