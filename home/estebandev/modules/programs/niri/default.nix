{
  pkgs,
  lib,
  config,
  ...
}:let 
    dir = "niri";
    colors = config.lib.stylix.colors;
    screenshot-path = "~/Pictures/Screenshots/Screenshot_%Y-%m-%d %H-%M-%S.png";
    radius = "3";
  in{

  home.file = {
    
    ".config/${dir}/config.kdl".text = import ./config.kdl.nix {
      inherit colors; inherit screenshot-path; inherit radius;
    };
  };

  # xdg.configFile."xdg-desktop-portal/portals.conf".text = ''
  #   [preferred]
  #   org.freedesktop.impl.portal.FileChooser=gtk
  # '';
}
