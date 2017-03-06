if type --quiet "gdate"
  set BINDATE "/usr/local/bin/gdate"
else
  set BINDATE "/bin/date"
end

if type --quiet "gls"
  set BINLS "/usr/local/bin/gls --color --time-style long-iso"
else
  set BINLS "/bin/ls"
end

if type --quiet "gsed"
  set BINSED "/usr/local/bin/gsed"
else
  set BINSED "sed"
end

alias ls="$BINLS -hF"
# -A list all but not . and ..
# -l long format
# -h human readable
# -G no group name
# -p append "/" to directories
alias ll="$BINLS -lhGp"
alias lll="$BINLS -lhGpA"
alias sed="$BINSED"
alias tree="tree -C -N"
alias df="df -h"
alias du='du -sh'
alias vim_upgrade='vim +PlugUpdate +qall'
alias wget="aria2c"
alias dl="aria2c"
alias json-pretty-print='python -mjson.tool | pygmentize -l javascript'
alias mv="mv -i"
alias cp="cp -r"
alias diff='colordiff -u'
alias grep='grep --color'
alias free='free -h'
alias iftop="iftop -P -N -b -B"
alias netstat="netstat -ln -f inet"
alias pdate='date "+DATE: %Y-%m-%d%nTIME: %H:%M:%S"'
alias clj='lein repl'
alias fish-iterm2-integration-update \
  "curl -L 'https://iterm2.com/misc/fish_startup.in' -o ~/.config/fish/fish.d/iterm2.fish"


# php
alias php56='/usr/bin/php'
alias phpcbf-psr2='phpcbf --standard=PSR2'
alias phpcbf-moodle='phpcbf --standard=~/src/moodle/local/codechecker/moodle'
alias phpcs-psr2='phpcs --standard=PSR2'
alias phpcs-moodle='phpcs --standard=~/src/moodle/local/codechecker/moodle'

# emacs
alias emacs="emacs -nw"
alias ec='emacsclient -t'

# Navigation
function ..    ; cd .. ; end
function ...   ; cd ../.. ; end
function ....  ; cd ../../.. ; end
function ..... ; cd ../../../.. ; end

function ld     ; tree --dirsfirst -aFCNL 1 $argv ; end
function lld    ; tree --dirsfirst -ChFupDaLg 1 $argv ; end

# Utilities
function digga    ; command dig +nocmd $argv[1] any +multiline +noall +answer; end
function grep     ; command grep --color=auto $argv ; end
function httpdump ; sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E "Host\: .*|GET \/.*" ; end
function ip       ; curl -s http://checkip.dyndns.com/ | sed 's/[^0-9\.]//g' ; end
function localip  ; ipconfig getifaddr en0 ; end
function lookbusy ; cat /dev/urandom | hexdump -C | grep --color "ca fe" ; end
function rkt      ; racket -il xrepl $argv ; end
function tmux     ; command tmux -2 $argv ; end
function tunnel   ; ssh -D 8080 -C -N $argv ; end

function ag -d 'fast search'
  # -U --skip-vcs-ignores
  #   Ignore VCS ignore files (.gitignore, .hgignore), but still use .ignore.
  command ag --ignore=dist \
    --ignore=.git \
    --ignore=log \
    --ignore=tags \
    --ignore=tmp \
    --ignore=vendor \
    --ignore=node_modules \
    --ignore=spec/vcr \
    $argv;
end

# fzf
function fd
  set -l FZFTEMPFILE $TMPDIR/fzffe.result.tmp
   find . -path '*/\.*' -prune -o -type d -print \
     | fzf>$FZFTEMPFILE; and cd (cat $FZFTEMPFILE)
end

function fe
  set -l FZFTEMPFILE $TMPDIR/fzffe.result.tmp
  fzf --query="$argv[1]" --multi --select-1 \
    --exit-0>$FZFTEMPFILE; and vim (cat $FZFTEMPFILE)
end

function fco -d "Fuzzy-find and checkout a branch"
  git branch --all | grep -v HEAD | string trim | fzf | xargs git checkout
end

function fcoc -d "Fuzzy-find and checkout a commit"
  git log --pretty=oneline --abbrev-commit --reverse | fzf +s | xargs git checkout
end

function sss
  if test (count $argv) -eq 1
    set DIR "$HTTPROOT/$argv[1]";
  else if test (count $argv) -eq 2
    set project $argv[2]
    if test $argv[1] = "api"
      set DIR "$HOME/salt-developer/code/api/$project"
    else if test $argv[1] = "site"
      set DIR "$HOME/salt-developer/code/site/$project"
    else
      set DIR "$HOME/salt-developer/code/$argv[1]/$project"
    end
  else
    set DIR $HTTPROOT
  end

  if test -d $DIR
    echo "Entering \"$DIR\""
    cd "$DIR"
  else
    echo "\"$DIR\" doesn't exist"
  end
end

function c
  set url 'https://www.google.com/complete/search?client=hp&hl=en&xhr=t'
  curl -H 'user-agent: Mozilla/5.0' -sSG --data-urlencode "q=$argv" "$url" \
    | jq -r .[1][][0] \
    | gsed 's#</\?b>#\*#g'
end


function mvn-java-app
  mvn archetype:generate -DgroupId=org.dongsheng -DartifactId=$argv[1] \
    -DarchetypeArtifactId=maven-archetype-quickstart \
    -DinteractiveMode=false
end
