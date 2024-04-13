{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    solaar = {
      url = "github:Svenum/Solaar-Flake/latest"; # For latest stable version
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, solaar }: {
    # replace nix with your hostname
    nixosConfigurations.nix = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
          solaar.nixosModules.default
          ./configuration.nix
      ];
    };
  };
}
