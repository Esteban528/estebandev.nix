{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: 
{
  services.xserver.videoDrivers = ["amdgpu" "modesetting"];
  environment.systemPackages = with pkgs; [
    xorg.xf86videoamdgpu
    vulkan-loader
    vulkan-tools
    clinfo
    radeontop
    ocl-icd
  ];

  environment.variables = {
    LD_LIBRARY_PATH = "${pkgs.vulkan-loader}/lib";
  };

  hardware.graphics = {
    enable=true;
    enable32Bit = true;

    extraPackages = with pkgs; [
      mesa.drivers
      amdvlk
      driversi686Linux.amdvlk
    ];
    extraPackages32 = with pkgs; [driversi686Linux.amdvlk];
  };
}
