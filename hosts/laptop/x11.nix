{...} : {
  services.libinput.enable = true;
  # Enable the X11 windowing system.
  services.displayManager.sddm.wayland.enable = true;

  services.xserver = {
    enable = true;
    videoDrivers = ["amdgpu"];
    # desktopManager.gnome.enable = true;

    desktopManager = {
      xterm.enable = false;
    };

    # Configure keymap in X11
    xkb.layout = "latam";
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;
}
