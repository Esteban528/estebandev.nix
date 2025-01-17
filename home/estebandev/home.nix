{
  pkgs,
  lib,
  config,
  pkgs-stable,
  ...
}: let
  stablePackages = with pkgs-stable; [
    azure-cli
    azure-functions-core-tools
    sshfs
    maven
    rustc
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

  home.packages = with pkgs;
    [
      bat
      alacritty
      tmux
      thunderbird
      obs-studio
      nautilus
      starship
      firefox
      vlc
      tree
      vesktop
      playerctl
      btop
      htop
      # wezterm
      dig
      # spotube
      zapzap
      telegram-desktop
      joshuto
      yazi
      evince
      gedit
      ktorrent
      vscode
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
      hyprshot

      insync
      insync-nautilus

      parabolic
    ]
    ++ stablePackages;
  home.stateVersion = "23.11";
}
