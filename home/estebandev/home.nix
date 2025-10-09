{
  pkgs,
  lib,
  config,
  pkgs-stable,
  inputs,
  ...
}: let
  stablePackages = with pkgs-stable; [
    # azure-cli
    # azure-functions-core-tools
    mdcat
    dbeaver-bin
    fzf
    fd
    # lact
    inkscape
    prismlauncher
    fuseiso
  ];
in {
  imports = [./modules];
  home.username = "estebandev";
  home.homeDirectory = "/home/estebandev";

  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs;
    [
      wineWowPackages.stable
      bottles
      cloudflared
      qbittorrent
      parabolic
      strawberry
      kdePackages.okular
      helvum
      inputs.pomodoro.packages.${system}.default
      wiremix
      xfce.mousepad
      librewolf
      foliate
      tmux
      gimp
      obs-studio
      vlc
      tree
      btop
      htop
      dig
      telegram-desktop
      obsidian
      anki-bin
      jq
      just
      fastfetch
      gdb
      #kiwix-tools
      R
    ]
    ++ stablePackages;

  home.stateVersion = "23.11";
}
