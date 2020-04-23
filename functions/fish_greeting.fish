function fish_greeting --description 'Greeting'
  if type --quiet "fortune"
    fortune -a
  end
end
