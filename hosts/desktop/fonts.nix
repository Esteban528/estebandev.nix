{pkgs, ...} : {
  nixpkgs.config.input-fonts.acceptLicense = true;
  fonts = {
    fontconfig = {
      enable = true;
      hinting = {
        enable = true;
        style = "none";
      };
      antialias = true;

    };
    packages = with pkgs; [
        nerd-fonts.noto
        # nerd-fonts.droid-sans-mono
        nerd-fonts.iosevka
        # nerd-fonts.hack
        # nerd-fonts.jetbrains-mono
        maple-mono.NF
        # pixel-code
        recursive
        scientifica
        dejavu_fonts
        nerd-fonts.fira-code
        nerd-fonts.hack
        input-fonts
      ];
      fontconfig.defaultFonts = {
        serif = [ "DejaVu Serif" ];
        sansSerif = [ "DejaVu Sans" ];
        monospace = [ "Maple Mono NF" ];
      };
  };
}
