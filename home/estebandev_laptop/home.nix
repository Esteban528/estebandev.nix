{
  pkgs,
  lib,
  config,
  pkgs-stable,
  inputs,
  ...
}: let
  stablePackages = with pkgs-stable; [
    parabolic
    ps_mem
    mdcat
    dbeaver-bin
    fzf
    fd
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
      kdePackages.kdenlive
      foliate
      loupe
      uv
      tmux
      obs-studio
      vlc
      tree
      playerctl
      dig
      kdePackages.okular
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
