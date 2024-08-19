{
  pkgs,
  ...
}: let
  dir = "hypr";
in {

  home.packages = with pkgs; [
    hyprlock
  ];

  programs.hyprlock.enable = true;
  home.file = {
    ".config/${dir}/hyprlock.conf".source = ./hyprlock.conf;
  };
}
