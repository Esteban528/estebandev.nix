{pkgs, ...}: {
  imports = [
    ./stylix
    ./kitty
    ./hypr
    ./eww
    ./fish
    ./wofi
    ./wezterm
    ./nh
  ];

  programs.btop.enable = true;
  programs.htop.enable = true;
  programs.joshuto.enable = true;
}
