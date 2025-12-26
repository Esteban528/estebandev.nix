{pkgs, ...} : {
  fonts = {
    packages = with pkgs; [
        nerd-fonts.fira-code
        nerd-fonts.noto
        # nerd-fonts.droid-sans-mono
        # nerd-fonts.iosevka
        # nerd-fonts.hack
        # nerd-fonts.jetbrains-mono
        maple-mono.NF
        # pixel-code
        # scientifica
        dejavu_fonts
        nerd-fonts.hack
        nerd-fonts.inconsolata
      ];
      fontconfig.defaultFonts = {
        serif = [ "DejaVu Serif" ];
        sansSerif = [ "DejaVu Sans" ];
        monospace = [ "Maple Mono NF" ];
      };
  };
}
