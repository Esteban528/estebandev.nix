{pkgs, ...} : {
  systemd.tmpfiles.rules = [
    "L+ /var/lib/qemu/firmware - - - - ${pkgs.qemu}/share/qemu/firmware"
    #"L+ /usr/libexec/virtiofsd - - - - ${pkgs.virtiofsd}/bin/virtiofsd"
  ];

  # virtualisation.libvirtd = {
  #   enable = true;
  #   qemu = {
  #     package = pkgs.qemu_kvm;
  #     runAsRoot = true;
  #     swtpm.enable = true;
  #     ovmf = {
  #       enable = true;
  #       packages = [(pkgs.OVMF.override {
  #         secureBoot = true;
  #         tpmSupport = true;
  #       }).fd];
  #     };
  #   };
  # };

  #users.groups.libvirtd.members = ["estebandev"];
  # virtualisation.spiceUSBRedirection.enable = true;

  environment.systemPackages = with pkgs; [
    qemu
    virt-viewer
    freerdp
  ];

  # boot.binfmt.emulatedSystems = [
  #   "aarch64-linux"
  #   "riscv64-linux"
  # ];
}
