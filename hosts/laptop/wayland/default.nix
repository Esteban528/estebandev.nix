{
  pkgs,
  lib,
  config,
  ...
}:{

  environment.systemPackages = with pkgs; [
    wl-clipboard
    xdg-desktop-portal
    # xdg-desktop-portal-gtk

    # hyprpaper
    hyprpicker
    xwayland-satellite
  ];

  # programs.niri =  {
  #   enable = true;
  # };

  # programs.hyprland = {
  #   enable = true;
  #   # xwayland.enable = true;
  # };

  #programs.xwayland.enable = lib.mkForce false;
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };

  security.polkit.enable = true;
}
