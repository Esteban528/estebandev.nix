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
    wezterm
    dig
    spotube
    gimp
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
    nautilus-open-any-terminal
    zed-editor
    sqlitebrowser
    onedrive
    syncthing

    jq
    just
  ];
  home.stateVersion = "23.11";
}
