# Defined in - @ line 1
function mux --wraps='tmuxp load dev' --description 'alias mux=tmuxp load dev'
  tmuxp load dev $argv;
end
