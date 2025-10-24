{pkgs, ...}: {
  imports = [
    ./stylix
    ./sway
    #./niri
     ./alacritty
    # ./nh
  ];

  programs.btop.enable = true;
  programs.htop.enable = true;
}
