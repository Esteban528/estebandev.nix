{pkgs, ...}: {
  imports = [
    ./stylix
    ./hypr
    ./eww
    ./fish
    ./wofi
    ./terminal
    # ./nh
  ];

  programs.btop.enable = true;
  programs.htop.enable = true;
}
