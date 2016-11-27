if type --quiet "gdate"
  set OSX_DATE "/usr/local/bin/gdate"
else
  set OSX_DATE "/bin/date"
end

if type --quiet "gls"
  set OSX_LS "/usr/local/bin/gls --color --time-style long-iso"
else
  set OSX_LS "/bin/ls"
end

if type --quiet "gsed"
  set OSX_SED "/usr/local/bin/gsed"
else
  set OSX_SED "/usr/bin/sed"
end

alias clj 'lein repl'
alias vim_upgrade 'vim +PlugUpdate +qall'
alias wget "aria2c"
alias dl "aria2c"
alias json-pretty-print 'python -mjson.tool | pygmentize -l javascript'
alias mv "mv -i"
alias cp "cp -r"
alias df 'df -H'
alias du 'du -sh'
alias diff 'colordiff -u'
alias grep 'grep --color'
alias free 'free -h'
alias ag "ag -U --noheading --ignore-dir 'vendor' --ignore-dir 'node_modules' --ignore 'bundle.js'"
alias iftop "iftop -P -N -b -B"
alias netstat "netstat -ln -f inet"
alias pdate 'date "+DATE: %Y-%m-%d%nTIME: %H:%M:%S"'

# php
alias phpcbf-psr2 'phpcbf --standard=PSR2'
alias phpcbf-moodle 'phpcbf --standard=/var/www/moodle/local/codechecker/moodle'
alias phpcs-psr2 'phpcs --standard=PSR2'
alias phpcs-moodle 'phpcs --standard=/var/www/moodle/local/codechecker/moodle'

# emacs
alias emacs "emacs -nw"
alias ec 'emacsclient -t'

alias ls="$OSX_LS -hF"
alias ll="$OSX_LS -lhGp"
alias sed="$OSX_SED"
# -A list all but not . and ..
# -l long format
# -h human readable
# -G no group name
# -p append "/" to directories
alias lll="$OSX_LS -lhGpA"
# Navigation
function ..    ; cd .. ; end
function ...   ; cd ../.. ; end
function ....  ; cd ../../.. ; end
function ..... ; cd ../../../.. ; end

function ld     ; tree --dirsfirst -aFCNL 1 $argv ; end
function lld    ; tree --dirsfirst -ChFupDaLg 1 $argv ; end

# Utilities
function a        ; command ag --ignore=.git --ignore=log --ignore=tags --ignore=tmp --ignore=vendor --ignore=spec/vcr $argv ; end
function c        ; pygmentize -O style=monokai -f console256 -g $argv ; end
function d        ; du -h -d=1 $argv ; end
function df       ; command df -h $argv ; end
function digga    ; command dig +nocmd $argv[1] any +multiline +noall +answer; end
function g        ; git $argv ; end
function grep     ; command grep --color=auto $argv ; end
function httpdump ; sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E "Host\: .*|GET \/.*" ; end
function ip       ; curl -s http://checkip.dyndns.com/ | sed 's/[^0-9\.]//g' ; end
function localip  ; ipconfig getifaddr en0 ; end
function lookbusy ; cat /dev/urandom | hexdump -C | grep --color "ca fe" ; end
function mp       ; vim $argv ; end
function rkt      ; racket -il xrepl $argv ; end
function t        ; command tree -C $argv ; end
function tmux     ; command tmux -2 $argv ; end
function tunnel   ; ssh -D 8080 -C -N $argv ; end

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
