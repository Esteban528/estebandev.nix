{...} : {
  # Enable CUPS to print documents.
  #services.printing.enable = true;

  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "wezterm";
  };

  services.udisks2.enable = true;
  services.gvfs.enable = true;
}
