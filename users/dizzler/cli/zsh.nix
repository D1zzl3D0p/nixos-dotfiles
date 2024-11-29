{ ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    oh-my-zsh = {
      enable = true;
      theme = "lambda";
    };
    shellAliases = {
      nixos-dir = "cd $HOME/.nixos";
      update = "nixos-dir && sudo nix flake update && sudo nixos-rebuild switch --flake .";
    };
  };
}
