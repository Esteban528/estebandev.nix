{pkgs,...} : {

  networking.hostName = "nixos"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  #Firewall
  networking.firewall = {
   enable = true;
   allowedTCPPorts = [3000 4200 8080 2121 25575 25565 2121 22005];
   allowedUDPPorts = [34197 2205 2203 2121 22126 22003];
  };

  # services.cloudflare-warp = { 
  #   enable = false;
  # };


  services.resolved.enable = true;
  services.openssh.enable = true;
  networking.nameservers = [  "1.1.1.1" "1.0.0.1" "8.8.8.8" ];

  # services.netbird.enable = false; # for netbird service & CLI
  # environment.systemPackages = [ pkgs.netbird-ui ]; # for GUI
}
