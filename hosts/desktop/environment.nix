{
  pkgs,
...}: 
 let
  unstablePkgs = with pkgs; [
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

  environment.systemPackages = with pkgs;
    [
      vim
      zip
      bash
      git
      #simple-mtpfs
      #python311
      libnotify
      ripgrep
    ]
    ++ unstablePkgs;

}
