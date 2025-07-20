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
    hyprpicker
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
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-wlr
      pkgs.xdg-desktop-portal-gtk
    ];
    config = {
      common = {
        default = ["wlr" "gtk"];
        "org.freedesktop.impl.portal.ScreenCast" = "wlr";
        "org.freedesktop.impl.portal.Screenshot" = "wlr";
        "org.freedesktop.impl.portal.RemoteDesktop" = "wlr";
        "org.freedesktop.impl.portal.FileChooser" = "gtk";
      };
    };
  };

  # xdg.portal = {
  # common = {
  #   default = [
  #     "gtk"
  #   ];
  # };
  # }
  programs.xwayland.enable = lib.mkForce false;
  security.polkit.enable = true;
  services.dbus.enable = true;
}
