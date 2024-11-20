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
  ];
in{
  imports = [./modules];
  home.username = "estebandev";
  home.homeDirectory = "/home/estebandev";

  home.packages = with pkgs; [
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
    nautilus
    nautilus-python
    htop
    wezterm
    dig
    # spotube
    gimp-with-plugins
    inkscape
    mpc-cli
    obs-studio
    lazygit
    zapzap
    telegram-desktop
    joshuto
    # yazi
    evince
    filezilla
    image-roll
    kitty
    gedit
    ktorrent
    vscode
    postman
    dbeaver-bin
    zed-editor
    sqlitebrowser
    onedrive
    obsidian
    anki-bin
    jq
    just
    fastfetch
    shipwright
    bottles-unwrapped
    protonplus

    # azure-functions-core-tools
    # (azure-cli.withExtensions [azure-cli.extensions.aks-preview])

    #Office
    libreoffice-qt
    hunspell
    hunspellDicts.es_CO
    hunspellDicts.es_ES

    gcalcli
    mission-center
    rustc
    # nailgun
    spotify
    ps_mem
    mdcat
    hyprshot
  ] ++ stablePackages;
  home.stateVersion = "23.11";
}
