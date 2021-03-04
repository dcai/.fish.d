function fish_greeting --description 'Greeting'
  if type -q "fortune"
    fortune -a
  end
end
