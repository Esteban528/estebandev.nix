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
    rustc
    ps_mem
    mdcat
    dbeaver-bin
    fzf
    fd
    lact
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
      bun
      ferdium
      # inputs.zen-browser.packages."x86_64-linux".default
      inputs.desktopbar.packages.${system}.default
      inputs.wiremix.packages.${system}.default
      kdePackages.kdenlive
      xfce.mousepad
      fuzzel
      # ungoogled-chromium
      librewolf
      python311
      anydesk
      foliate
      bat
      uv
      tmux
      #thunderbird
      gimp
      obs-studio
      starship
      #  brave 
      vlc
      tree
      # vesktop
      playerctl
      btop
      htop
      dig
      telegram-desktop
      joshuto
      postman
      onedrive
      obsidian
      anki-bin
      jq
      just
      fastfetch

      # nailgun
      spotify
    ]
    ++ stablePackages;

  home.stateVersion = "23.11";
}
