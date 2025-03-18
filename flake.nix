{
  description = "NixOS configuration";

  inputs = {

    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.05";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    stylix.url = "github:danth/stylix";
    nixpkgs-staging-next.url = "github:nixos/nixpkgs/staging-next";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    zen-browser.url = "github:0xc000022070/zen-browser-flake";

    astal = {
      url = "github:aylur/astal";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ags = {
      url = "github:aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    nixpkgs-staging-next,
    nixpkgs-stable,
    home-manager,
    stylix,
    ...
  } @ inputs: let
    system = "x86_64-linux";

    pkgs-staging-next =
      import nixpkgs-staging-next {
      };

    pkgs-stable = import nixpkgs-stable {
      inherit system;
      config.allowUnfree = true;
    };
    localSystem = {system = "x86_64-linux";};
  in {
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;

    nixosConfigurations = {
      pelusa = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit nixpkgs-staging-next;
          inherit inputs;
          inherit pkgs-stable;
        };

        modules = [
          home-manager.nixosModules.home-manager
          ./hosts/pelusa/configuration.nix
          # inputs.stylix.nixosModules.stylix
          {
            # home-manager.useGlobalPkgs = false;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "hm-backup";
            home-manager.users.estebandev = {
              imports = [
                ./home/estebandev/home.nix
                stylix.homeManagerModules.stylix
              ];
            };

            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
            home-manager.extraSpecialArgs = {
              inherit inputs;
              inherit pkgs-stable;
            };
          }
        ];
      };

    };
  };
}
