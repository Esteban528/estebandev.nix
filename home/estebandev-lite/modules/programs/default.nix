{pkgs, ...}: {
  imports = [
    ./stylix
    ./kitty
    ./hypr
    ./fish
    ./wofi
    ./waybar
  ];

  programs.btop.enable = true;
  programs.htop.enable = true;
  programs.joshuto.enable = true;

}
