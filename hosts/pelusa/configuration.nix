# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{
  config,
  inputs,
  lib,
  pkgs,
  pkgs-staging-next,
  pkgs-stable,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./hardware.nix
    ./audio.nix
    ./networking.nix
    ./shell
    ./environment.nix
    ./ollama
    ./wayland
    ./podman
    ./x11.nix
    ./qemu
    ./fonts.nix
    ./misc.nix
    ./waydroid
    ./thunar
    ./steam
  ];

  nix.optimise.automatic = true;
  nix.settings.auto-optimise-store = true;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  #Bootloader
  boot.loader = {
    efi.canTouchEfiVariables = true;

    grub = {
    enable = true;
      device = "nodev";
      efiSupport = true; 
      useOSProber = true;
      configurationLimit = 2;
    };
  };

  time.timeZone = "America/Bogota";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    #keyMap = "la-latin1";
    useXkbConfig = true; # use xkb.options in tty.
  };

  #Nix flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.estebandev = {
    isNormalUser = true;
    description = "Esteban Gonzalez Florez";
    extraGroups = ["wheel" "docker" "libvirtd" "libvirtd"];
  };
  users.groups.libvirt = {};

  programs.nix-ld.enable = true;
  programs.nix-ld.package = pkgs.nix-ld-rs;
  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc.lib
    xorg.libXcomposite
    xorg.libXtst
    xorg.libXrandr
    # ... (other libraries)
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };


  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.05"; # Did you read the comment?
}
