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
      valgrind
      wineWowPackages.stable
      bottles
      cloudflared
      qbittorrent
      parabolic
      strawberry
      kdePackages.okular
      helvum
      vesktop
      # inputs.desktopbar.packages.${system}.default
      wiremix
      kdePackages.kdenlive
      xfce.mousepad
      librewolf
      #anydesk
      foliate
      uv
      tmux
      gimp
      obs-studio
      vlc
      tree
      btop
      htop
      dig
      telegram-desktop
      #postman
      onedrive
      obsidian
      anki-bin
      jq
      just
      fastfetch
      gdb
    ]
    ++ stablePackages;

  home.stateVersion = "23.11";
}
