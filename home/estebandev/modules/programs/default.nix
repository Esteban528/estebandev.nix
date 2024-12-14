{pkgs, ...}: {
  imports = [
    ./stylix
    ./hypr
    ./eww
    ./wofi
    ./terminal
    # ./nh
  ];

  programs.btop.enable = true;
  programs.htop.enable = true;
}
