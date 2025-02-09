{
  description = "My NixOS configuration";
  # referencing https://nixos-and-flakes.thiscute.world/nixos-with-flakes/nixos-with-flakes-enabled for much of this

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixos-cosmic.url = "github:lilyinstarlight/nixos-cosmic";
    nixos-cosmic.inputs.nixpkgs.follows = "nixpkgs";

    hyprland.url = "github:hyprwm/Hyprland";

    hydenix-nixpkgs.url = "github:nixos/nixpkgs/ecd26a469ac56357fd333946a99086e992452b6a";

    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "hydenix-nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, nixos-cosmic, hyprland, ... }@inputs: {
    nixosConfigurations.regice = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
	# pretty sure this is setting up cachix, I'm not sure what cachix is...
	{
	  nix.settings = {
	    # importing the cachix cosmic thing
	    substituters = [ 
	    	"https://hyprland.cachix.org"
	    	"https://cosmic.cachix.org/" 
		"https://cache.nixos.org/" 
		"https://nix-community.cachix.org"
	    ];
	    trusted-public-keys = [ 
	    	"cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE=" 
	    	"hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      		"cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      		"nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
	    ];
	  };
	}

      	./hosts/regice

	nixos-cosmic.nixosModules.default
	home-manager.nixosModules.home-manager{
	  home-manager.useGlobalPkgs = true;
	  home-manager.useUserPackages = true;
	  home-manager.users.dizzler = import ./users/dizzler;
	  #optionally use home-manager.extraSpecialArgs to pass args to home.nix
	  }
      ];
    };
  };
}
