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
    nautilus
    nitch
    playerctl
    btop
    htop
    dig
    spotube
    gimp
    inkscape
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
    nautilus-open-any-terminal
    zed-editor
    sqlitebrowser
    onedrive
    obsidian

    jq
    just
  ];
  programs.bat.enable = true;
  home.stateVersion = "23.11";
}
