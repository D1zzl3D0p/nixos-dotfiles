{ config, pkgs, ... }:

{
  imports = [
    ./zsh.nix
    ./git.nix
  ];

  home.packages = with pkgs; [
    neofetch
    ranger
    fzf
    # provides nom, which works like nix, but with better logs
    nix-output-monitor 

    # monitoring
    htop
    iotop # io
    iftop # network

    ffmpeg

    R
    python3
  ];
}
