{pkgs,...}:{
programs.nautilus-open-any-terminal = {
  enable = true;
  terminal = "kitty";
};

environment = {
  sessionVariables.NAUTILUS_4_EXTENSION_DIR = "${pkgs.gnome.nautilus-python}/lib/nautilus/extensions-4";
  pathsToLink = [
    "/share/nautilus-python/extensions"
  ];

  systemPackages = with pkgs; [
    gnome.nautilus
    gnome.nautilus-python
  ];
};
}
