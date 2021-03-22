function __fish_tmuxp_using_command
    set -l cmd (commandline -opc)
    if [ (count $cmd) -gt 1 ]
        if [ $argv[1] = $cmd[2] ]
            return 0
        end
    end
    return 1
end

# complete -f -c tmuxp -a 'load'
complete --command tmuxp -n __fish_use_subcommand -xa load -d "load tmuxp profile"
# complete --command tmuxp -n __fish_use_subcommand -xa ls -d "list tmuxp profiles"
complete -f -c tmuxp -n '__fish_tmuxp_using_command load' -a '(tmuxp ls)'
