{
  pkgs,
  lib,
  config,
  ...
}:let 
    dir = "niri";
    colors = config.lib.stylix.colors;
    screenshot-path = "~/Pictures/Screenshots/Screenshot_%Y-%m-%d %H-%M-%S.png";
  in{

  home.file = {
    
    ".config/${dir}/config.kdl".text = import ./config.kdl.nix {
      inherit colors; inherit screenshot-path;
    };
  };
}
