if status --is-interactive
    abbr -a -g dfc 'watch -c -n 30 dfc -c always'
    abbr -a -g ld 'tree --dirsfirst -aFCNL 1'
    abbr -a -g lld 'tree --dirsfirst -ChFupDaLg 1'
    abbr -a -g mux 'tmuxp load'
    abbr -a -g pywatch 'while true; find . -iname "*.py" | entr -rdc poetry run test; end'
    abbr -a -g vd "env HTTPS_PROXY='http://127.0.0.1:1087/' annie -aria2"
    abbr -a -g vim-upgrade "vim +PlugUpdate +qall"
    abbr -a -g wget "curl -C - -O"
    abbr -a -g behat-init-a11y "php admin/tool/behat/cli/init.php -j=1 --axe -a=classic"
    abbr -a -g behat-run-a11y 'ROOT="$HOME/moodles/stable_master" vendor/bin/behat --format="moodle_progress" --out="std" --format="progress" --out="$ROOT/extra/behat/progress.txt" --format="pretty" --out="$ROOT/extra/behat/progress_pretty.txt" --config="$ROOT/moodledata_behat/behatrun/behat/behat.yml" --profile=headlesschrome --tags "@accessibility"'
end
