{
  config,
  pkgs,
  lib,
  ...
}: let
  dir = "sway";
in {
  home.file = {
    ".config/${dir}/config".text = builtins.readFile ./config;
  };
}
