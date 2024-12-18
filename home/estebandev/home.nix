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
    prismlauncher
    sshfs
    maven
    rustc
    ps_mem
    mdcat
    dbeaver-bin
    jdk11
    libsecret
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
      brave
      firefox
      vlc
      tree
      vesktop
      nitch
      playerctl
      btop
      htop
      wezterm
      dig
      # spotube
      zapzap
      telegram-desktop
      # joshuto
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
      protonplus

      #Office
      libreoffice-qt
      hunspell
      hunspellDicts.es_CO
      hunspellDicts.es_ES

      # nailgun
      spotify
      hyprshot
    ]
    ++ stablePackages;
  home.stateVersion = "23.11";
}
