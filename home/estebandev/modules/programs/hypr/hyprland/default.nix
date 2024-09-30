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

  # programs.swww.enable = true;

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    extraConfig = import ./config.nix {
      inherit enable_animations color1 color2;
    };
  };
}
