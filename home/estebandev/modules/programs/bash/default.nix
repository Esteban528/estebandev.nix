{...} : {
programs.bash = {
    enable = true;
    loginShellInit = ''eval "$(fnm env --use-on-cd --shell bash)"'';
    interactiveShellInit = '''';
  }
}
