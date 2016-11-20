function fish_prompt --description 'Write out the prompt'
    # Just calculate this once, to save a few cycles when displaying the prompt
    if not set -q __fish_prompt_hostname
        set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
    end

    set -l color_cwd
    set -l suffix
    switch $USER
        case root toor
            if set -q fish_color_cwd_root
                set color_cwd $fish_color_cwd_root
            else
                set color_cwd $fish_color_cwd
            end
            set suffix '#'
        case '*'
            set color_cwd $fish_color_cwd
            set suffix '>'
    end

    set match_start (set_color blue)'('(set_color normal)
    set match_end (set_color blue)')'(set_color normal)

    echo -n -s \
      "$match_start" \
      "$USER" @ "$__fish_prompt_hostname" \
      "$match_end" \
      ' ' \
      (set_color $color_cwd) (prompt_pwd) (set_color normal) \
      "$suffix "
end
