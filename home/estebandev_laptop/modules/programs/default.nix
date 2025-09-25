{pkgs, ...}: {
  imports = [
    ./stylix
    #./hypr
    ./niri
    # ./eww
    # ./wofi
    ../../../shared/progams/terminal/alacritty
    ./yazi
    # ./nh
  ];

  programs.btop.enable = true;
  programs.htop.enable = true;
}
