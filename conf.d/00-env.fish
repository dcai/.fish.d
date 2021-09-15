set -gx EDITOR vim
set -gx FISHHOME "$HOME/.config/fish"
set -gx GOBIN "$GOPATH/bin"
set -gx GOPATH "$HOME/.go"
set -gx LC_ALL en_US.UTF-8
set -gx PAGER less
set -gx RIPGREP_CONFIG_PATH "$HOME/.ripgreprc"
set -gx TIME_STYLE long-iso
set -gx XDG_CACHE_HOME "$HOME/.cache"
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_DATA_HOME "$HOME/.local/share"
set -gx fish_prompt_pwd_dir_length 0
set -gx DOTNET_CLI_TELEMETRY_OPTOUT 1
set -gx HOMEBREW_NO_ANALYTICS 1
# set -gx LESSOPEN '|pygmentize %s'
# set -gx FZF_DEFAULT_COMMAND 'rg --files --color never --hidden --column'

function source_script
    test -f $argv[1]; and source $argv[1]
end

function add_one_path --description 'Add a directory to $PATH'
    set -l added 0
    for path in $PATH
        if test $path = $argv[1]
            set -l added 1
        end
    end
    # only add $argv[1] when it's not yet in $PATH
    if test 0 -eq $added
        test -d $argv[1]; and set PATH $argv[1] $PATH
        #test -d $argv[1]; and set fish_user_paths $argv[1] $fish_user_paths
    end
end

function add_paths --description 'Add a list of paths to $PATH'
    for p in $argv
        add_one_path $p
    end
end

function echoi --description "echo in interactive mode only"
    if status --is-interactive
        echo $argv[1]
    end
end

add_paths \
    /usr/local/bin \
    /usr/local/sbin \
    /usr/local/share/npm/bin \
    "$GOPATH/bin" \
    ~/Dropbox/bin \
    ~/.bin \
    ~/.cabal/bin \
    ~/.config/composer/vendor/bin \
    ~/.fzf/bin \
    ~/.gem/ruby/2.6.0/bin \
    ~/.gem/ruby/2.7.0/bin \
    ~/.poetry/bin \
    ~/.krew/bin \
    ~/.local/bin \
    ~/.dotnet/tools \
    ~/.npm-packages/bin

# if type -q ruby
#     set -l RUBYGEMHOME (ruby -r rubygems -e "puts Gem.user_dir")
#     add_one_path "$RUBYGEMHOME/bin"
# end

# if type -q opam
#     eval (opam env)
# end

# opam configuration
if [ -f "$HOME/.opam/opam-init/init.fish" ]
    source $HOME/.opam/opam-init/init.fish >/dev/null 2>/dev/null; or true
end
