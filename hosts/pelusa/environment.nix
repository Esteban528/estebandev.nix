{
  pkgs,
  pkgs-staging-next,
  pkgs-stable,
...}: 
 let
  unstablePkgs = with pkgs; [
    neovim
    openssl
    imv 

    freerdp
    iproute2
    dialog
    xdg-utils

    xdg-desktop-portal
    xdg-desktop-portal-wlr
    xdg-desktop-portal-gtk
  ];
in{
  environment.sessionVariables = rec {
    _JAVA_AWT_WM_NONREPARENTING = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
    OZONE_PLATFORM = "wayland";
    EDITOR = "nvim";
    ANKI_WAYLAND = "1";
    DISABLE_QT5_COMPAT = "1";
    NIXOS_XDG_OPEN_USE_PORTAL = "1";
    QT_QPA_PLATFORM = "wayland;xcb";
    SDL_VIDEODRIVER = "wayland";
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  environment.systemPackages = with pkgs-stable;
    [
      vim
      zip
      unzip
      unar
      bash
      gcc
      cargo
      wget
      git
      killall
      socat
      run
      libGL
      file
      mtpfs
      simple-mtpfs
      python311
      libnotify
      libaio
      pcsclite
      playerctl

      nix-prefetch-git

      ripgrep

      gst_all_1.gstreamer
      gst_all_1.gst-plugins-base
      gst_all_1.gst-plugins-good
      gst_all_1.gst-plugins-bad
      gst_all_1.gst-plugins-ugly
      #    gst-libav

      libGL
      libGLU
      iproute2
      gnumake
    ]
    ++ unstablePkgs;

}
