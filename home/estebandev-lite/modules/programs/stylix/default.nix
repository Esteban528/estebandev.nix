{
  pkgs,
  lib,
  config,
  ...
}: {
  home.packages = with pkgs; [
    colloid-icon-theme
    adwaita-icon-theme
  ];

  stylix = {
    enable = true;
    autoEnable = true;

    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
    image = ./assets/gruvbox-dark-blue.png;

    cursor.package = pkgs.bibata-cursors;
    cursor.name = "Bibata-Modern-Ice";
    cursor.size = 20;
  };
  # stylix.targets.hyprpaper.enable = lib.mkForce false;

  # stylix.targets.gtk.enable = true;
  # stylix.targets.hyprpaper.enable = true;
  # stylix.targets.dunst.enable = true;

  # home.sessionVariables.EMPHASIS_COLOR = config.lib.stylix.colors.base0E;
}
