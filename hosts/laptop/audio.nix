{pkgs, ...} : {
  # Enable sound.
  # sound.enable = true;
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    # alsa.enable = true;
    # alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  # environment.systemPackages = with pkgs; [
  #   alsa-lib
  #   alsa-utils
  #   alsa-tools
  # ];
}
