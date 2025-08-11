{pkgs, ...}: {
  imports = [
    ./stylix
    ../../../shared/dotfiles/sway
    #./niri
    # ./eww
    # ./wofi
    ../../../shared/progams
    ./yazi
    # ./nh
  ];

  programs.btop.enable = true;
  programs.htop.enable = true;
}
