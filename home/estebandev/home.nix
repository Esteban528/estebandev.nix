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
    sshfs
    rustc
    ps_mem
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
      cloudflared
      valgrind
      qbittorrent
      parabolic
      strawberry
      imv 
      kdePackages.okular
      helvum
      lutris
      ferdium
      inputs.desktopbar.packages.${system}.default
      inputs.wiremix.packages.${system}.default
      kdePackages.kdenlive
      xfce.mousepad
      fuzzel
      librewolf
      python311
      anydesk
      foliate
      bat
      uv
      tmux
      gimp
      obs-studio
      vlc
      tree
      playerctl
      btop
      htop
      dig
      telegram-desktop
      postman
      onedrive
      obsidian
      anki-bin
      jq
      just
      fastfetch

    ]
    ++ stablePackages;

  home.stateVersion = "23.11";
}
