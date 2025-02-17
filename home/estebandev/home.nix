{
  pkgs,
  lib,
  config,
  pkgs-stable,
  inputs,
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
    lact
    inkscape
  ];
in {
  imports = [./modules];
  home.username = "estebandev";
  home.homeDirectory = "/home/estebandev";

  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs;
    [
      inputs.zen-browser.packages."x86_64-linux".default
      bat
      alacritty
      tmux
      thunderbird
      gimp
      obs-studio
      nautilus
      starship
      #  brave 
      vlc
      tree
      vesktop
      playerctl
      btop
      htop
      dig
      telegram-desktop
      joshuto
      yazi
      evince
      gedit
      ktorrent
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

      parabolic
    ]
    ++ stablePackages;
  home.stateVersion = "23.11";
}
