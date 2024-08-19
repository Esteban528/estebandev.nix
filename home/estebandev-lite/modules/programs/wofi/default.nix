{
  pkgs,
  config,
  lib,
  ...
}: let
  dir = "wofi";
  colors = config.lib.stylix.colors;
in {

  home.packages = with pkgs; [
   wofi 
  ];

  programs.hyprlock.enable = true;
  home.file = {
    ".config/${dir}/style.css".text = import ./style.css.nix {
        inherit colors;
      };

    ".config/${dir}/config".text = ''
      allow_images=true
      no_actions=true
      hide_scroll=true
      width=34%
      height=34%
    '';
  };
}
