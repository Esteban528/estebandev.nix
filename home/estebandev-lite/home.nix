{
  pkgs,
  lib,
  config,
  pkgs-stable,
  ...
}: 
let 
  stablePackages =  with pkgs-stable;[
  ];
in{

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
    yazi 
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
    spotify

  ] ++ stablePackages;
  programs.bat.enable = true;
  home.stateVersion = "23.11";
}
