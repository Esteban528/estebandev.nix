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
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/kanagawa.yaml";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/grayscale-dark.yaml";
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/ayu-light.yaml";
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-hard.yaml";

    image = ./assets/gruvboxwlp.png;
    # image = ./assets/wp1933981.png;

    cursor.package = pkgs.bibata-cursors;
    cursor.name = "Bibata-Modern-Ice";
    cursor.size = 20;

    fonts = {
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };

      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
      monospace = {
        package = pkgs.jetbrains-mono;
        name = "Jetbrains Mono";
      };
    };
  };

  # stylix.targets.gtk.enable = true;
  # stylix.targets.hyprpaper.enable = false;
  stylix.targets.hyprpaper.enable = lib.mkForce false;
  stylix.targets.wezterm.enable = false;

  # home.sessionVariables.EMPHASIS_COLOR = config.lib.stylix.colors.base0E;
}
