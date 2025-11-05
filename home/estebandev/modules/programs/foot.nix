{ lib, ... }: {
  programs.foot = {
    enable = true;
    settings = {
      main = {
        term = lib.mkForce "xterm-256color";
        font = lib.mkForce "Maple Mono NF:size=12";
        # dpi-aware = "yes"; 
      };

      # window = {
      #   pad = "0x0"; # Padding equivalente
      #   # Foot no tiene dynamic_padding, siempre aplica el valor fijo
      # };

      # environment = {
      #   WINIT_X11_SCALE_FACTOR = "1.0";
      # };
    };
  };
}
