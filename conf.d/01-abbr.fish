if status --is-interactive
  abbr --add --global first 'echo my first abbreviation'
  abbr --add --global second 'echo my second abbreviation'
  abbr --add --global gco git checkout
  abbr --add --global pywatch 'while true; find . -iname "*.py" | entr -rdc poetry run test; end'
end
