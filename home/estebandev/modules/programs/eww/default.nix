{
  config,
  pkgs,
  lib,
  ...
}: let
  dir = "eww";
  colors = config.lib.stylix.colors;
  imageDir = ./config/assets;
  scriptsDir = ./config/scripts;
in {
  # programs.eww.enable = true;
  # programs.eww.configDir = /home/estebandev/.config/eww;

  home.packages = with pkgs; [
    eww
  ];

  home.file = {
    ".config/${dir}/assets/music.jpg".source = "${imageDir}/music.jpg";
    ".config/${dir}/assets/nixos-icon.png".source = "${imageDir}/nixos-icon.png";
    ".config/${dir}/assets/pill.png".source = "${imageDir}/pill.png";
    ".config/${dir}/assets/profile.png".source = "${imageDir}/profile.png";

    ".config/${dir}/scripts/battery.py".source = "${scriptsDir}/battery.py";
    ".config/${dir}/scripts/calendar.sh".source = "${scriptsDir}/calendar.sh";
    ".config/${dir}/scripts/change-active-workspace".source = "${scriptsDir}/change-active-workspace";
    ".config/${dir}/scripts/date-time.sh".source = "${scriptsDir}/date-time.sh";
    ".config/${dir}/scripts/dispatch.sh".source = "${scriptsDir}/dispatch.sh";
    ".config/${dir}/scripts/get-active-workspace".source = "${scriptsDir}/get-active-workspace";
    ".config/${dir}/scripts/get-workspaces".source = "${scriptsDir}/get-workspaces";
    ".config/${dir}/scripts/idleinhibit.sh".source = "${scriptsDir}/idleinhibit.sh";
    ".config/${dir}/scripts/keyboard layout.sh".source = "${scriptsDir}/keyboard layout.sh";
    ".config/${dir}/scripts/Launch".source = "${scriptsDir}/Launch";
    ".config/${dir}/scripts/monitor.sh".source = "${scriptsDir}/monitor.sh";
    ".config/${dir}/scripts/music_info".source = "${scriptsDir}/music_info";
    ".config/${dir}/scripts/network.sh".source = "${scriptsDir}/network.sh";
    ".config/${dir}/scripts/start.sh".source = "${scriptsDir}/start.sh";
    ".config/${dir}/scripts/updateOnedrive.sh".source = "${scriptsDir}/updateOnedrive.sh";
    ".config/${dir}/scripts/widget.sh".source = "${scriptsDir}/widget.sh";

    ".config/${dir}/eww.yuck".text = builtins.readFile ./config/eww.yuck;
    ".config/${dir}/widgets/eww.yuck".text = builtins.readFile ./config/widgets/eww.yuck;

    ".config/${dir}/eww.scss".text = import ./config/eww.scss.nix {
      inherit colors;
    };
  };
}
