{...} : {
  services.ollama = {
    enable = true;
    acceleration = "rocm";
    environmentVariables = {
      HCC_AMDGPU_TARGET = "gfx90c";
    };
    # rocmOverrideGfx = "10.3.1";
    loadModels = [
      "deepseek-r1:7b"
    ];
  };
}
