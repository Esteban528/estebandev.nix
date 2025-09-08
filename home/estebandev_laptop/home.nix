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
    ps_mem
    mdcat
    dbeaver-bin
    fzf
    fd
    lact
    inkscape
    prismlauncher
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
      librewolf
      cmake
      cloudflared
      strawberry
      bun
      kdePackages.kdenlive
      fuzzel
      foliate
      loupe
      exiftool
      bat
      uv
      tmux
      thunderbird
      gimp
      obs-studio
      starship
      #  brave 
      vlc
      tree
      vesktop
      playerctl
      dig
      telegram-desktop
      kdePackages.okular
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
      R
      inputs.pomodoro.packages.${system}.default
    ]
    ++ stablePackages;

  home.stateVersion = "23.11";
}
