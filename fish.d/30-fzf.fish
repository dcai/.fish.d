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
  git submodule update
end

function fcoc -d "Fuzzy-find and checkout a commit"
  git log --pretty=oneline --abbrev-commit --reverse | fzf +s | xargs git checkout
  git submodule update
end

