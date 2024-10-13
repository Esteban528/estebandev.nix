{
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [./modules];
  home.username = "estebandev";
  home.homeDirectory = "/home/estebandev";
  home.packages = with pkgs; [
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
    spotube
    gimp-with-plugins
    inkscape
    mpc-cli
    obs-studio
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
    maven
    vscode
    postman
    dbeaver-bin
    zed-editor
    sqlitebrowser
    onedrive
    obsidian
    anki-bin
    prismlauncher
    jq
    just
    fastfetch
    shipwright
    bottles-unwrapped
    protonplus

    azure-functions-core-tools
    (azure-cli.withExtensions [azure-cli.extensions.aks-preview])

    #Office
    libreoffice-qt
    hunspell
    hunspellDicts.es_CO
    hunspellDicts.es_ES
  ];
  home.stateVersion = "23.11";
}
