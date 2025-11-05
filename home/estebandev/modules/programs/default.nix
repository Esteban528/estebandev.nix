{pkgs, ...}: {
  imports = [
    ./stylix
    ./sway
    #./niri
    #./alacritty
    # ./nh
    ./foot.nix
  ];

  programs.btop.enable = true;
  programs.htop.enable = true;
}
