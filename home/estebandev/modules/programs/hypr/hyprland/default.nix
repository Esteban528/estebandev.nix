# took reference from rxyhn's dotfiles.
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
  home.packages = with pkgs; [
    wl-clipboard
    xdg-desktop-portal
    # xdg-desktop-portal-gtk

    # hyprpaper
    hyprpicker
    hyprcursor
    slurp
    grim
    swww
  ];

  services.hyprpaper.enable = lib.mkForce false;

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
