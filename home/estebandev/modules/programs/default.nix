{pkgs, ...}: {
  imports = [
    ./stylix
    ./hypr
    ./eww
    ./wofi
    ./terminal
    ./yazi
    # ./nh
  ];

  programs.btop.enable = true;
  programs.htop.enable = true;
}
