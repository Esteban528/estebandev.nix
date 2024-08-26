{pkgs, ...}: {
  imports = [
    ./stylix
    ./kitty
    ./hypr
    ./eww
    ./fish
    ./wofi
  ];

  programs.btop.enable = true;
  programs.htop.enable = true;
  programs.joshuto.enable = true;
}
