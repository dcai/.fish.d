set -gx NODEJS_CHECK_SIGNATURES 'no'

[ -f $HOME/.asdf/asdf.fish ]; and source $HOME/.asdf/asdf.fish

set -l NPM12_BIN $HOME/.asdf/installs/nodejs/12.16.2/.npm/bin
[ -d $NPM12_BIN ]; and add_paths $NPM12_BIN
