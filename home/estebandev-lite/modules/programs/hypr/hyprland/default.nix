{
  pkgs,
  lib,
  config,
  pkgs-stable,
  ...
}: let
  enable_animations = "yes";
  color1 = config.lib.stylix.colors.base0D;
  color2 = config.lib.stylix.colors.base02;
in {
  home.packages = with pkgs; [
    brightnessctl
    wl-clipboard
    xdg-desktop-portal
    xdg-desktop-portal-gtk

    hyprland
    hyprpaper
    hyprpicker
    hyprcursor
    slurp
    grim
    swww
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    xwayland.enable = true;

    extraConfig = import ./config.nix {
      inherit enable_animations color1 color2;
    };
  };

  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.colloid-icon-theme;
      name = "Colloid";
    };
  };
}
