if status --is-interactive
  abbr --add --global gco git checkout
  abbr --add --global pywatch 'while true; find . -iname "*.py" | entr -rdc poetry run test; end'
  abbr --add --global dfc 'watch -c -n 30 dfc -c always'
  abbr --add --global vd "env HTTPS_PROXY="http://127.0.0.1:1087/" annie -aria2"
end
