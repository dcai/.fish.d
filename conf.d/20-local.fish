if type -q "gdate"
  set BINDATE (which gdate)
else
  set BINDATE "/bin/date"
end

if type -q "gls"
  set BINLS (which gls)" --color --time-style long-iso"
else
  set BINLS "/bin/ls"
end

if type -q "gsed"
  set BINSED (which gsed)
else
  set BINSED "sed"
end

alias ls="$BINLS -hF"
# -A list all but not . and ..
# -l long format
# -h human readable
# -G no group name
# -p append "/" to directories
if type -q "exa"
  alias ll="exa -l"
  alias lll="exa -bghHliSa"
else
  alias ll="$BINLS -lhGp"
  alias lll="$BINLS -lhGpA"
end

# brew install fd
if ! command --search 'fd' >/dev/null do
  if ! command --search 'fdfind' >/dev/null do
    alias fd="find . -iname"
  else
    # findfd is installed
    set -gx FZF_DEFAULT_COMMAND 'fdfind --type f'
    alias fd="fdfind"
  end
else
  # fd is isntalled
  set -gx FZF_DEFAULT_COMMAND 'fd --type f'
end

alias k="kubectl"
alias g="gcloud"
alias sed="$BINSED"
alias tree="tree -C -N"
alias df="df -h"
alias du='du -sh'
alias dl="aria2c --check-certificate=false"
alias aria2c="aria2c --check-certificate=false"
alias mv="mv -i"
alias cp="cp -r"
alias diff='colordiff -u'
alias grep='grep --color'
alias free='free -h'
alias iftop="iftop -P -N -b -B"
alias netstat="netstat -ln -f inet"
alias pdate='date "+DATE: %Y-%m-%d%nTIME: %H:%M:%S"'
alias clj='lein repl'
alias less='less -R'

# emacs
#alias e="emacs -nw"
alias e="emacs -nw -q -l ~/.emacs.d/init.el"
alias ec='emacsclient -t'
alias killemacs='emacsclient --eval "(kill-emacs)"'
alias tmux='tmux -2'

# Navigation
function ..    ; cd .. ; end
function ...   ; cd ../.. ; end
function ....  ; cd ../../.. ; end
function ..... ; cd ../../../.. ; end

# Utilities
# function grep     ; command grep --color=auto $argv ; end
# function rkt      ; racket -il xrepl $argv ; end
function digga    ; command dig +nocmd $argv[1] any +multiline +noall +answer; end
function httpdump ; sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E "Host\: .*|GET \/.*" ; end
function ip       ; curl -s http://checkip.dyndns.com/ | sed 's/[^0-9\.]//g' ; end
function localip  ; ipconfig getifaddr en0 ; end
function lookbusy ; cat /dev/urandom | hexdump -C | grep --color "ca fe" ; end
function tunnel   ; ssh -D 8080 -C -N $argv ; end

function ag -d 'fast search'
  # -U --skip-vcs-ignores
  #   Ignore VCS ignore files (.gitignore, .hgignore), but still use .ignore.
  command ag \
    --ignore-case \
    --ignore=dist \
    --ignore=build \
    --ignore=.git \
    --ignore=log \
    --ignore=tags \
    --ignore=tmp \
    --ignore=vendor \
    --ignore=node_modules \
    $argv;
end

function c
  set url 'https://www.google.com/complete/search?client=hp&hl=en&xhr=t'
  curl -H 'user-agent: Mozilla/5.0' -sSG --data-urlencode "q=$argv" "$url" \
    | jq -r .[1][][0] \
    | gsed 's#</\?b>#\*#g'
end
