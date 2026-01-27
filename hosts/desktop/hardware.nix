{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: 
{
  services.xserver.videoDrivers = ["amdgpu" "modesetting"];
  environment.variables = {
    LD_LIBRARY_PATH = "${pkgs.vulkan-loader}/lib";
  };

  hardware.bluetooth.enable = true;
  services.blueman.enable = true; # opcional GUI

  hardware.graphics = {
    enable=true;
    enable32Bit = true;

    extraPackages = with pkgs; [
      mesa

      xorg.xf86videoamdgpu
      vulkan-loader
      vulkan-tools
      # amdvlk
      #driversi686Linux.amdvlk
    ];
    # extraPackages32 = with pkgs; [driversi686Linux.amdvlk];
  };
}
