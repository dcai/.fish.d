if type --quiet "brew"
  add_one_path (brew --prefix)"/bin"
  add_one_path (brew --prefix php72)"/bin"
end
