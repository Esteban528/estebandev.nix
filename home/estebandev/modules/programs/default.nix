{pkgs, ...}: {
  imports = [
    ./stylix
    ./hypr
    ./niri
    ./eww
    ./wofi
    ./terminal
    ./yazi
    # ./nh
  ];

  programs.btop.enable = true;
  programs.htop.enable = true;
}
