{
  pkgs,
  lib,
  config,
  ...
}: {
  stylix = {
    enable = true;
    autoEnable = true;
    polarity = "dark";
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/nord.yaml";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/espresso.yaml";
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/atelier-estuary.yaml";
    # base16Scheme = ./themes/yoru.yml;
    # base16Scheme = "${pkgs-stable.schemes-nix}/share/themes/sober.yaml";
    # base16Scheme = "${pkgs-stable.schemes-nix}/share/themes/flexoki.yaml";

    # base16Scheme = "${pkgs.base16-schemes}/share/themes/everforest-dark-hard.yaml";
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/precious-dark-eleven.yaml";
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-hard.yaml";
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";

    # image = ./assets/wallpaper.png;
    # image = ./assets/wp1933981.png;

    # cursor.package = pkgs.bibata-cursors;
    # cursor.name = "Bibata-Modern-Ice";
    # cursor.size = 20;

    iconTheme = {
      enable = true;
      package = pkgs.papirus-icon-theme;
      dark = "Papirus-Dark";
      light = "Papirus-Light";
    };
  };

  # stylix.targets.gtk.enable = true;
  # stylix.targets.hyprpaper.enable = false;
  # stylix.targets.yazi.enable = true; 
  # stylix.targets.hyprpaper.enable = lib.mkForce false;

  stylix.targets.sway.enable = true;
  # stylix.targets.wezterm.enable = false;

  # home.sessionVariables.EMPHASIS_COLOR = config.lib.stylix.colors.base0E;
  # gtk.iconTheme = {
  #   enable = true;
  #   name = "mint-y-icons";
  #   package = pkgs.mint-y-icons;
  # };
}
