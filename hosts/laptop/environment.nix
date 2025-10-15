{
  pkgs,
  pkgs-staging-next,
  pkgs-stable,
...}: 
 let
  unstablePkgs = with pkgs; [
    neovim
    openssl
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
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  environment.systemPackages = with pkgs-stable;
    [
      vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
      gnumake
      zip
      unzip
      unar
      bash
      git
      run
      simple-mtpfs

      libnotify

      ripgrep

      brightnessctl
      python311
      protonvpn-cli
    ]
    ++ unstablePkgs;

}
