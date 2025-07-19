{lib, ...} : {
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        padding = {
          x = 6;
        };
        dimensions = {
          lines = 3;
          columns = 200;
        };
      };
      env = {
        TERM = "xterm-256color";
      };
      font = {
        size = lib.mkForce 10;
        normal = {
           family = lib.mkForce "Hack Nerd Font";
           style = "Regular";
        };
      };
    };
  }; 
}
