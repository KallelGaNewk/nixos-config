{
  description = "A simple personal NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      nur,
      ...
    }:
    {
      nixosConfigurations = {
        castle = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            home-manager.nixosModules.home-manager
            nur.modules.nixos.default
            ./machines/castle
            ./modules/shell.nix
            ./modules/grub.nix

            ./modules/essentials.nix
            ./modules/services
            ./modules/location.nix
            ./modules/steam.nix
            ./modules/nvidia.nix
          ];
        };
        lapcat = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            home-manager.nixosModules.home-manager
            nur.modules.nixos.default
            ./machines/lapcat
            ./modules/shell.nix
            ./modules/grub.nix

            ./modules/essentials.nix
            # ./modules/services
            ./modules/location.nix

            ./modules/steam.nix
            ./modules/services/openssh.nix
            ./modules/services/pipewire.nix
            ./modules/services/printing.nix
            ./modules/services/pantheon.nix
          ];
        };
      };
    };
}
