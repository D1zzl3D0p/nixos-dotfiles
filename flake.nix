{
  description = "My NixOS configuration";
  # referencing https://nixos-and-flakes.thiscute.world/nixos-with-flakes/nixos-with-flakes-enabled for much of this

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    # import home-homemanager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    # import cosmic-desktop
    nixos-cosmic.url = "github:lilyinstarlight/nixos-cosmic";
    nixos-cosmic.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager/*, nixos-cosmic*/, ... }@inputs: {
    nixosConfigurations.regice = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
	# pretty sure this is setting up cachix, I'm not sure what cachix is...
	{
	  nix.settings = {
	    # importing the cachix cosmic thing
	    #substituters = [ "https://cosmic.cachix.org/" ];
	    #trusted-public-keys = [ "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE=" ];
	  };
	}
	# actually calling cosmic desktop
	# nixos-cosmic.nixosModules.default

      	./hosts/regice.nix
	./desktops/default.nix
	./packages/default.nix
	#./desktops/cosmic.nix

	# get home-manager to work
	home-manager.nixosModules.home-manager{
	  home-manager.useGlobalPkgs = true;
	  home-manager.useUserPackages = true;
	  home-manager.users.dizzler = import ./home/home.nix;
	  #optionally use home-manager.extraSpecialArgs to pass args to home.nix
	  }
      ];
    };
  };
}
