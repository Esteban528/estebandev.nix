{pkgs, ...}: {
  imports = [
    ./stylix
    ./sway
    #./niri
    #./alacritty
    # ./nh
    ./foot.nix
    ./librewolf.nix
  ];

 # programs.direnv.enable = true;
  programs.btop.enable = true;
  programs.htop.enable = true;
}
