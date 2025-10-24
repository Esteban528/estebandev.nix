{pkgs, ...}: let
  dir = "hypr";
in {
  programs.hyprlock.enable = true;
 #home.file = {
 #  ".config/${dir}/hyprlock.conf".source = ./hyprlock.conf;
 #};
}
