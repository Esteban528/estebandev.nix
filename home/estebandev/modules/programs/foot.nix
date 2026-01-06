{ lib, ... }: {
  programs.foot = {
    enable = true;
    settings = {
      main = {
        term = lib.mkForce "xterm-256color";
        font = lib.mkForce " Hack Nerd Font Mono:size=12";
        dpi-aware = lib.mkForce "yes"; 
      };

      # environment = {
      #   WINIT_X11_SCALE_FACTOR = "1.0";
      # };
    };
  };
}
