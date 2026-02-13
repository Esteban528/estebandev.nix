
{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    package = pkgs.fishMinimal;

    shellInit = builtins.readFile ./config.fish;
    shellAliases = {
      nv = "nvim";
      cls = "clear";
    };

    functions = {
      __fish_command_not_found_handler = {
        body = "__fish_default_command_not_found_handler $argv[1]";
        onEvent = "fish_command_not_found";
      };

      fish_greeting = {
        body = "";
      };

      gitignore = "curl -sL https://www.gitignore.io/api/$argv";
    };
  };
}
