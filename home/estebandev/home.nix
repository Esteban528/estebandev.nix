{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: let 
 spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
in{
  imports = [./modules];
  home.username = "estebandev";
  home.homeDirectory = "/home/estebandev";
  programs.librewolf.enable = true;
  programs.spicetify = {
   enable = true;
   enabledExtensions = with spicePkgs.extensions; [
     adblockify
     hidePodcasts
     shuffle # shuffle+ (special characters are sanitized out of extension names)
   ];
   # colorScheme = "sleek";
  };

  home.packages = with pkgs;
    [
      jq
      vscode
      codex
      signal-desktop
      insomnia
      helvum
      onlyoffice-desktopeditors
      lf
      unzip
      vlc
      unar
      neovim
      telegram-desktop
      imv 
      wineWow64Packages.stable
      bottles
      # cloudflared
      qbittorrent
      # parabolic
      strawberry
      kdePackages.okular
      # helvum
      # inputs.pomodoro.packages.${system}.default
      wiremix
      # xfce.mousepad
      foliate
      tmux
      # gimp
      # obs-studio
      # vesktop
      # vlc
      # tree
      btop
      htop
      # telegram-desktop
      obsidian
      # anki-bin
      # jq
      gnumake
      dbeaver-bin
      # fastfetch
      fd
      fzf
      uv
      # gdb
      # kiwix-tools
      # R
    ];

  home.stateVersion = "23.11";
}
