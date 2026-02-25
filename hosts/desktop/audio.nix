{pkgs, ...} : {
  # Enable sound.
  # sound.enable = true;
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    # alsa.enable = false;
    # alsa.support32Bit = false;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  hardware.bluetooth.enable = true;
  services.blueman.enable = true; # opcional GUI
}
