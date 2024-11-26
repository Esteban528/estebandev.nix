{
  pkgs,
  lib,
  config,
  pkgs-stable,
  ...
}: 
let 
  stablePackages =  with pkgs-stable;[
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
  ];
in{
  imports = [./modules];
  home.username = "estebandev";
  home.homeDirectory = "/home/estebandev";

  home.packages = with pkgs; [
    obs-studio
    nautilus
    starship
    neofetch
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
    mpc-cli
    lazygit
    zapzap
    telegram-desktop
    # joshuto
    yazi
    evince
    filezilla
    image-roll
    kitty
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

    # azure-functions-core-tools
    # (azure-cli.withExtensions [azure-cli.extensions.aks-preview])

    #Office
    libreoffice-qt
    hunspell
    hunspellDicts.es_CO
    hunspellDicts.es_ES

    # nailgun
    spotify
    hyprshot
  ] ++ stablePackages;
  home.stateVersion = "23.11";
}
