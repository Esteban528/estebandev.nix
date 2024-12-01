{pkgs, ...}: {
  imports = [
    ./kitty
    ./wezterm
    ./tmux.nix
  ];
}
