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
    joshuto
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
    pipx

    jq
    just

    #Office
    libreoffice-qt
    hunspell
    hunspellDicts.es_CO
    hunspellDicts.es_ES
  ];
  home.stateVersion = "23.11";
}
