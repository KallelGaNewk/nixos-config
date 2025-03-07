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

  outputs = inputs@{ nixpkgs, home-manager, nur, ... }: {
    nixosConfigurations = {
      castle = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          home-manager.nixosModules.home-manager
          nur.modules.nixos.default

          ./machines/castle
          ./modules/services
          ./modules/location.nix
          ./modules/steam.nix
          ./modules/nvidia.nix

          ./users/home-newky.nix
        ];
      };
      lapcat = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          home-manager.nixosModules.home-manager
          nur.modules.nixos.default

          ./machines/lapcat
          ./modules/services
          ./modules/location.nix
        ];
      };
    };
  };
}
