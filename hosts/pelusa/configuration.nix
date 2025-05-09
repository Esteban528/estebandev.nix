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
}: let
  unstablePkgs = with pkgs; [
    neovim
  ];
in {
  imports = [
    ./hardware-configuration.nix
    ./hardware.nix
    ./shell
    ./ollama
    ./wayland
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

  networking.hostName = "pelusaNixos"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "America/Bogota";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  #Firewall
  # networking.firewall = {
  #   enable = true;
  #   allowedTCPPorts = [3000];
  #   allowedUDPPorts = [];
  # };

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    #keyMap = "la-latin1";
    useXkbConfig = true; # use xkb.options in tty.
  };

  services.libinput.enable = true;
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    videoDrivers = ["amdgpu"];
    # desktopManager.gnome.enable = true;

    displayManager.gdm.enable = true;
    desktopManager = {
      xterm.enable = false;
    };

    # Configure keymap in X11
    xkb.layout = "latam";
  };


  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  #Nix flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Environment variables
  environment.sessionVariables = rec {
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";

    _JAVA_AWT_WM_NONREPARENTING = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
    OZONE_PLATFORM = "wayland";
    EDITOR = "nvim";
    ANKI_WAYLAND = "1";
    DISABLE_QT5_COMPAT = "1";
  };

  nixpkgs.config.allowUnfree = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.estebandev = {
    isNormalUser = true;
    description = "Esteban Gonzalez Florez";
    extraGroups = ["wheel" "docker" "libvirtd"]; # Enable ‘sudo’ for the user.
  };

  services.cloudflare-warp = { 
    enable = true;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget


  environment.systemPackages = with pkgs-stable;
    [
      vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
      zip
      unzip
      unar
      bash
      gcc
      cargo
      wget
      git
      wayland
      killall
      wl-clipboard
      unzip
      socat
      docker_27
      qemu 
      run
      wineWowPackages.stable
      winetricks
      libGL
      file
      mtpfs
      simple-mtpfs

      #Audio
      alsa-lib
      alsa-utils
      alsa-tools

      libnotify
      libaio
      pcsclite

      mpv
      nix-prefetch-git

      hyprland
      ripgrep

      gst_all_1.gstreamer
      gst_all_1.gst-plugins-base
      gst_all_1.gst-plugins-good
      gst_all_1.gst-plugins-bad
      gst_all_1.gst-plugins-ugly
      #    gst-libav

      openssl
      (pkgs.callPackage ../../pkgs/tdf/tdf.nix {})
      libGL
      libGLU
    ]
    ++ unstablePkgs;

  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "wezterm";
  };

  # qemu
  systemd.tmpfiles.rules = [ "L+ /var/lib/qemu/firmware - - - - ${pkgs.qemu}/share/qemu/firmware" ];
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
      ovmf = {
        enable = true;
        packages = [(pkgs.OVMF.override {
          secureBoot = true;
          tpmSupport = true;
        }).fd];
      };
    };
  };
  programs.virt-manager.enable = true;

  users.groups.libvirtd.members = ["estebandev"];
  virtualisation.spiceUSBRedirection.enable = true;

  programs.nix-ld.enable = true;
  programs.nix-ld.package = pkgs.nix-ld-rs;
  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc.lib
    xorg.libXcomposite
    xorg.libXtst
    xorg.libXrandr
    # ... (other libraries)
  ];

  # The module in this repository defines a new module under (programs.nix-ld.dev) instead of (programs.nix-ld)
  # to not collide with the nixpkgs version.
  #programs.nix-ld.dev.enable = true;

  # Fonts Configuration
  fonts.packages = with pkgs; [
    inter
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    liberation_ttf
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
    roboto
    iosevka
    nerd-fonts.fira-code
    nerd-fonts.droid-sans-mono
    nerd-fonts.iosevka
    nerd-fonts.hack
    nerd-fonts.jetbrains-mono
  ];

  services.udisks2.enable = true;

  # Waydroid
  virtualisation.waydroid.enable = true;

  # Steam
  # programs.steam = {
  #   enable = true;
  #   remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
  #   dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  #   localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  #   gamescopeSession.enable = true;
  # };

  # Docker
  virtualisation.docker.enable = true;

  services.gvfs.enable = true;

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      # "steam"
      # "steam-original"
      # "steam-run"
    ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [4200 8080];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

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
