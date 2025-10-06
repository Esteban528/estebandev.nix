{...} : {

  networking.hostName = "nixosLaptop"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  #Firewall
  networking.firewall = {
   enable = true;
   allowedTCPPorts = [3000 4200 8080 25575 25565];
   allowedUDPPorts = [];
  };

  services.cloudflare-warp = { 
    enable = true;
  };
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
}
