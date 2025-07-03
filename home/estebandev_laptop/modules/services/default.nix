{pkgs, ...}: {
  imports = [
    ./dunst
    ./hypridle
    ../../../shared/services
    ./hyprlock
  ];
}
