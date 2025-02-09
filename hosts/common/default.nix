{config, pkgs, ... }:

{
  nix = {

    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
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
