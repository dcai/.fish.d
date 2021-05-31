if status --is-interactive
  abbr --add --global dfc 'watch -c -n 30 dfc -c always'
  abbr --add --global ld "tree --dirsfirst -aFCNL 1"
  abbr --add --global lld "tree --dirsfirst -ChFupDaLg 1"
  abbr --add --global mux 'tmuxp load'
  abbr --add --global pywatch 'while true; find . -iname "*.py" | entr -rdc poetry run test; end'
  abbr --add --global vd "env HTTPS_PROXY='http://127.0.0.1:1087/' annie -aria2"
  abbr --add --global vim-upgrade "vim +PlugUpdate +qall"
  abbr --add --global wget "curl -C - -O"
  abbr --add --global behat-init-a11y "php admin/tool/behat/cli/init.php -j=1 --axe -a=classic"
  abbr --add --global behat-run-a11y 'ROOT="$HOME/moodles/stable_master" vendor/bin/behat --format="moodle_progress" --out="std" --format="progress" --out="$ROOT/extra/behat/progress.txt" --format="pretty" --out="$ROOT/extra/behat/progress_pretty.txt" --config="$ROOT/moodledata_behat/behatrun/behat/behat.yml" --profile=headlesschrome --tags "@accessibility"'
end
