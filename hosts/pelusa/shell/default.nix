{lib, ...} : {
  programs.bash = {
    loginShellInit = ''eval "$(fnm env --use-on-cd --shell bash)"'';
     interactiveShellInit = '''';
  };
}
