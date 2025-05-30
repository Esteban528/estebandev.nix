{
  pkgs,
  lib,
  config,
  ...
}:{

  environment.systemPackages = with pkgs; [
    wayland
    wl-clipboard
    xdg-desktop-portal
    # xdg-desktop-portal-gtk

    # hyprpaper
    hyprpicker
    hyprcursor
    slurp
    grim
    swww
    xwayland-satellite
  ];

  programs.niri =  {
    enable = true;
  };

  programs.hyprland = {
    enable = true;
    # xwayland.enable = true;
  };

  programs.xwayland.enable = lib.mkForce false;
}
