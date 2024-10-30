{pkgs, ...}: {
  imports = [
    ./stylix
    ./kitty
    ./hypr
    ./eww
    ./fish
    ./wofi
    ./wezterm
    ./spicetify
    # ./nh
  ];

  programs.btop.enable = true;
  programs.htop.enable = true;
  programs.joshuto.enable = true;
}
