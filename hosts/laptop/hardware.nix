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

  hardware.graphics = {
    enable=true;
    enable32Bit = true;

    extraPackages = with pkgs; [
      mesa
    ];
  };
}
