set -gx SHELL (which fish)
set -gx EDITOR vim
set -gx LC_ALL en_US.UTF-8
set -gx HTTPROOT "$HOME/src"
set -gx TIME_STYLE long-iso
set -gx PAGER less
set -gx fish_prompt_pwd_dir_length 3
set -gx GOPATH "$HOME/go"

# fish git prompt
set -gx __fish_git_prompt_showdirtystate 'yes'
set -gx __fish_git_prompt_showstashstate 'yes'
set -gx __fish_git_prompt_showupstream 'yes'
set -gx __fish_git_prompt_color_branch yellow

# Status Chars
set -gx __fish_git_prompt_char_dirtystate '⚡'
set -gx __fish_git_prompt_char_stagedstate '→'
set -gx __fish_git_prompt_char_stashstate '↩'
set -gx __fish_git_prompt_char_upstream_ahead '↑'
set -gx __fish_git_prompt_char_upstream_behind '↓'
