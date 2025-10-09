{pkgs, ...}: {
  imports = [
    ./stylix
    #./hypr
    #./niri
    # ./eww
    # ./wofi
    ../../../shared/progams/terminal/alacritty
    ../../../shared/dotfiles/sway
    ./yazi
    # ./nh
  ];

  programs.btop.enable = true;
  programs.htop.enable = true;
}
