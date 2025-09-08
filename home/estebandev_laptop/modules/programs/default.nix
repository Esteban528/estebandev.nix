{pkgs, ...}: {
  imports = [
    ./stylix
    #./hypr
    ./niri
    # ./eww
    # ./wofi
    ../../../shared/progams/terminal/alacritty
    ./yazi
    ./alacritty
    # ./nh
  ];

  programs.btop.enable = true;
  programs.htop.enable = true;
}
