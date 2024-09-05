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
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-hard.yaml";

    image = ./assets/gruvboxwlp.png;

    cursor.package = pkgs.bibata-cursors;
    cursor.name = "Bibata-Modern-Ice";
    cursor.size = 20;

    fonts = {
      serif = config.stylix.fonts.monospace;
      sansSerif = config.stylix.fonts.monospace;
      emoji = config.stylix.fonts.monospace;
      monospace = {
        package = pkgs.fira-code;
        name = "Fira code";
      };
    };
  };
  # stylix.targets.hyprpaper.enable = lib.mkForce false;

  # stylix.targets.gtk.enable = true;
  # stylix.targets.hyprpaper.enable = true;
  # stylix.targets.dunst.enable = true;

  # home.sessionVariables.EMPHASIS_COLOR = config.lib.stylix.colors.base0E;
}
