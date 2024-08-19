{
pkgs,
  ...
}: let
  dir = "hypr";
in {

  home.packages = with pkgs; [
    hypridle
  ];
  # services.hypridle.enable = true;
  home.file = {
    ".config/${dir}/hypridle.conf".source = ./hypridle.conf;
  };
}

