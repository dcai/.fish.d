if status --is-interactive
  abbr --add --global gco git checkout
  abbr --add --global pywatch 'while true; find . -iname "*.py" | entr -rdc poetry run test; end'
  abbr --add --global dfc 'watch -c -n 30 dfc -c always'
  abbr --add --global vd "env HTTPS_PROXY='http://127.0.0.1:1087/' annie -aria2"
  abbr --add --global swowv1 "tmuxp load wow-sg-v1"
  abbr --add --global swowv2 "tmuxp load wow-sg-v2"
  abbr --add --global smoodle "tmuxp load moodle"
  abbr --add --global behat-init-a11y "php admin/tool/behat/cli/init.php -j=1 --axe -a=classic"
  abbr --add --global behat-init "php admin/tool/behat/cli/init.php -j=1"
  abbr --add --global behat-run-a11y 'ROOT="$HOME/moodles/stable_master" vendor/bin/behat --format="moodle_progress" --out="std" --format="progress" --out="$ROOT/extra/behat/progress.txt" --format="pretty" --out="$ROOT/extra/behat/progress_pretty.txt" --config="$ROOT/moodledata_behat/behatrun/behat/behat.yml" --profile=headlesschrome --suite=classic --tags "@accessibility"'
  abbr --add --global behat-run 'ROOT="$HOME/moodles/stable_master" vendor/bin/behat --format="moodle_progress" --out="std" --format="progress" --out="$ROOT/extra/behat/progress.txt" --format="pretty" --out="$ROOT/extra/behat/progress_pretty.txt" --config="$ROOT/moodledata_behat/behatrun/behat/behat.yml" --profile=headlesschrome'
end
