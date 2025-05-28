{...} : {
  services.libinput.enable = true;
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    videoDrivers = ["amdgpu"];
    # desktopManager.gnome.enable = true;

    displayManager.gdm.enable = true;
    desktopManager = {
      xterm.enable = false;
    };

    # Configure keymap in X11
    xkb.layout = "latam";
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;
}
