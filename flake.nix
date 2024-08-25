{
  description = "NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-24.05 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.05";
    
    # home-manager.inputs.nixpkgs.follows = "nixpkgs";
    # home-manager, used for managing user configuration
    home-manager = {
      url = "github:nix-community/home-manager/master";
      # url = "github:nix-community/home-manager";
    };
    spicetify = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    vignesh = {
      url = "github:vigneshpai2003/dotfiles";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, ... }@inputs: {
    # Please replace my-nixos with your hostname
    nixosConfigurations.nixos = inputs.nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        inherit inputs;
      };

      modules = [
        # Import the previous configuration.nix we used,
        # so the old configuration file still takes effect
        ./configuration.nix
        # make home-manager as a module of nixos
        # so that home-manager configuration will be deployed automatically when executing `nixos-rebuild switch`
        inputs.home-manager.nixosModules.home-manager

        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = {
            inherit inputs;
          };

          home-manager.users.rudresh = {
            home.username = "rudresh";
            home.homeDirectory = "/home/rudresh";
            imports = [ ./home.nix  ];
          };
        }
      ];
    };
  };
}
