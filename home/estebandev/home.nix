{
  pkgs,
  lib,
  config,
  pkgs-stable,
  inputs,
  ...
}: let
  stablePackages = with pkgs-stable; [
    azure-cli
    azure-functions-core-tools
    parabolic
    sshfs
    rustc
    ps_mem
    mdcat
    dbeaver-bin
    fzf
    fd
    lact
    inkscape
    prismlauncher
    fuseiso
  ];
in {
  imports = [./modules];
  home.username = "estebandev";
  home.homeDirectory = "/home/estebandev";
  home.sessionVariables = {
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    XDG_SESSION_TYPE = "wayland";
  };

  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs;
    [
      helvum
      lutris
      bun
      ferdium
      # inputs.zen-browser.packages."x86_64-linux".default
      inputs.desktopbar.packages.${system}.default
      kdePackages.kdenlive
      fuzzel
      ungoogled-chromium
      file-roller
      python311
      anydesk
      foliate
      loupe
      exiftool
      bat
      uv
      tmux
      thunderbird
      gimp
      obs-studio
      nautilus
      starship
      #  brave 
      vlc
      tree
      # vesktop
      playerctl
      btop
      htop
      dig
      telegram-desktop
      joshuto
      evince
      gedit
      postman
      onedrive
      obsidian
      anki-bin
      jq
      just
      fastfetch

      #Office
      libreoffice-qt
      hunspell
      hunspellDicts.es_CO
      hunspellDicts.es_ES

      # nailgun
      spotify
    ]
    ++ stablePackages;

  home.stateVersion = "23.11";
}
