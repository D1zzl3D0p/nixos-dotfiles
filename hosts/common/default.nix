{config, pkgs, ... }:

{
  nix = {

    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 1w";
    };

  };

  # services.openssh.enable = true;
  nixpkgs.config.allowUnfree = true;

  environment = {
    systemPackages = with pkgs; [
      bash
      git
      wget
      curl
      neovim 
    ];
    variables.EDITOR = "nvim";
  };
}
