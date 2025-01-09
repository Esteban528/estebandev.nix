{...} : {
  programs.bash.shellAliases = ''
    eval "$(starship init bash)"
  '';
}
