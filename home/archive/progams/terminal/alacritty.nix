{lib, ...} : {
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        padding = {
          x = 0;
          y = 0;
        };
        dynamic_padding = true;
      };
      env = {
        WINIT_X11_SCALE_FACTOR = "1.0";
        TERM = "xterm-256color";
      };
      font = {
        size = lib.mkForce 12;
        normal = {
           family = lib.mkForce "Maple Mono NF";
           style = "Regular";
        };
      };
    };
  }; 
}
