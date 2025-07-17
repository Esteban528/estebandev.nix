{
  pkgs,
  lib,
  config,
  ...
}:{

  environment.systemPackages = with pkgs; [
    wayland
    wl-clipboard
    # xdg-desktop-portal
    # xdg-desktop-portal-gtk

    # hyprpaper
    # hyprpicker
    # hyprcursor
    # slurp
    # grim
    swww
    xwayland-satellite
  ];

  programs.niri =  {
    enable = true;
  };

  programs.hyprland = {
    enable = false;
    # xwayland.enable = true;
  };
  # xdg.portal = {
  #   enable = true;
  #   # wlr.enable = true;
  #   xdgOpenUsePortal = true;
  #   extraPortals = [ 
  #     pkgs.xdg-desktop-portal-gtk
  #     pkgs.xdg-desktop-portal-gnome
  #   ];
  # };
  programs.xwayland.enable = lib.mkForce false;
}
