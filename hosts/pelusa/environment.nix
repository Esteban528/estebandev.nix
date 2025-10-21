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
      cargo
      wget
      git
      run
      file
      simple-mtpfs
      python311
      libnotify

      ripgrep
      gnumake
    ]
    ++ unstablePkgs;

}
