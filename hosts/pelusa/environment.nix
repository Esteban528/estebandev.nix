{
  pkgs,
  pkgs-staging-next,
  pkgs-stable,
...}: 
 let
  unstablePkgs = with pkgs; [
    neovim
    openssl

    freerdp
    iproute2
    dialog
    bottles
    wineWowPackages.stable
    xdg-desktop-portal
    xdg-desktop-portal-gtk  
    xdg-utils
  ];
in{
  environment.sessionVariables = rec {
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";

    _JAVA_AWT_WM_NONREPARENTING = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
    OZONE_PLATFORM = "wayland";
    EDITOR = "nvim";
    ANKI_WAYLAND = "1";
    DISABLE_QT5_COMPAT = "1";
    GTK_USE_PORTAL = "1";  
    XDG_CURRENT_DESKTOP = "sway";  
    NIXOS_XDG_OPEN_USE_PORTAL = "1";
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  environment.systemPackages = with pkgs-stable;
    [
      vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
      zip
      unzip
      unar
      bash
      gcc
      cargo
      wget
      git
      killall
      unzip
      socat
      run
      winetricks
      libGL
      file
      mtpfs
      simple-mtpfs

      libnotify
      libaio
      pcsclite

      mpv
      nix-prefetch-git

      ripgrep

      gst_all_1.gstreamer
      gst_all_1.gst-plugins-base
      gst_all_1.gst-plugins-good
      gst_all_1.gst-plugins-bad
      gst_all_1.gst-plugins-ugly
      #    gst-libav

      (pkgs.callPackage ../../pkgs/tdf/tdf.nix {})

      libGL
      libGLU
      iproute2

    ]
    ++ unstablePkgs;

}
