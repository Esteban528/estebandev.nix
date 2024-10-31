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
    vlc
    tree
    vesktop
    nautilus
    playerctl
    btop
    htop
    dig
    gimp
    lazygit
    zapzap
    telegram-desktop
    joshuto
    evince
    kitty
    gedit
    maven
    postman
    dbeaver-bin
    nautilus-open-any-terminal
    onedrive
    obsidian
    anki-bin

    jq
    just
    rustc
    firefox
  ];
  programs.bat.enable = true;
  home.stateVersion = "23.11";
}
