{
  pkgs,
  lib,
  config,
  ...
}: let
  enable_animations = "yes";
  color1 = config.lib.stylix.colors.base0D;
  color2 = config.lib.stylix.colors.base02;
  base = config.lib.stylix.colors.base00;
in {
  # xdg.portal = {
  #   extraPortals = [pkgs.xdg-desktop-portal-wlr];
  #   config.hyprland = {
  #     default = ["wlr" "gtk"];
  #   };
  # };

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
    xwayland.enable = true;
    extraConfig = import ./config.nix {
      inherit enable_animations base color1 color2;
    };
  };

}
