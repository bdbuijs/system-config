{
  description = "Bram's MacOS configuration flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    # nixpkgs.url = "github:NixOS/nixpkgs/8809585e6937d0b07fc066792c8c9abf9c3fe5c4";

    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = inputs: {
    darwinConfigurations.Brams-MBP =
      inputs.darwin.lib.darwinSystem {
        system = "x86_64-darwin";
        pkgs = import inputs.nixpkgs {
          system = "x86_64-darwin";
        };
        modules = [
          ./modules/darwin
          inputs.home-manager.darwinModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.bram.imports = [ ./modules/home-manager ];
            };
          }
        ];
      };
  };
}
