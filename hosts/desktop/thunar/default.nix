{pkgs, ...}:{

  programs.thunar = {
    enable = true;
    plugins = with pkgs; [
      thunar-archive-plugin
      thunar-volman
    ];
  };

  environment.systemPackages = [
    pkgs.engrampa
  ];

  services.gvfs.enable = true;
  services.tumbler.enable = true; 
  # xdg.portal.config.preferred."org.freedesktop.impl.portal.FileChooser" = "thunar";
}
