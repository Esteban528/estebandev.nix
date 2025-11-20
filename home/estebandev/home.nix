{
  pkgs,
  lib,
  config,
  ...
}:{
  imports = [./modules];
  home.username = "estebandev";
  home.homeDirectory = "/home/estebandev";

  home.packages = with pkgs;
    [
      lf
      unzip
      vlc
      unar
      neovim
      telegram-desktop
      imv 
      wineWowPackages.stable
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
      librewolf
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
      # fastfetch
      fd
      fzf
      # gdb
      # kiwix-tools
      # R
      signal-desktop-bin
    ];

  home.stateVersion = "23.11";
}
