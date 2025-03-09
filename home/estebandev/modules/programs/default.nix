{pkgs, ...}: {
  imports = [
    ./stylix
    ./hypr
    ./eww
    ./wofi
    ./terminal
    ./yazi
    ./niri
    # ./nh
  ];

  programs.btop.enable = true;
  programs.htop.enable = true;
}
