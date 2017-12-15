# fzf
# enable ripgrep
# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)


# brew install fd
if command --search 'fd' >/dev/null do
  set -gx FZF_DEFAULT_COMMAND 'fd --type f'
else
  if command --search 'rg' >/dev/null do
    set -gx FZF_DEFAULT_COMMAND 'rg --files --no-ignore --hidden --follow --glob "!.git/*"'
  end
end

set -gx FZF_DEFAULT_OPTS '--ansi'

function ffd
  set -l FZFTEMPFILE $TMPDIR/fzffe.result.tmp
   find . -path '*/\.*' -prune -o -type d -print \
     | fzf>$FZFTEMPFILE; and cd (cat $FZFTEMPFILE)
end

function ffe
  set -l FZFTEMPFILE $TMPDIR/fzffe.result.tmp
  fzf --query="$argv[1]" --multi --select-1 \
    --exit-0>$FZFTEMPFILE; and vim (cat $FZFTEMPFILE)
end

function ffco -d "Fuzzy-find and checkout a branch"
  git branch --all | grep -v HEAD | string trim | fzf | xargs git checkout
  git submodule update
end

function ffcoc -d "Fuzzy-find and checkout a commit"
  git log --pretty=oneline --abbrev-commit --reverse | fzf +s | xargs git checkout
  git submodule update
end
