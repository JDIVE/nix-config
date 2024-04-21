{

  description = "Jamie's Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.11";
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    # Line below ensures home manager follows the package releases of the nixpkgs and they stay aligned
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
};

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
    nixosConfigurations = {
      ripper = lib.nixosSystem {
        inherit system;
        modules = [ ./configuration.nix ];  
    };
  };
    homeConfigurations = {
      jamie = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home.nix ];
  };

};
  };

}
