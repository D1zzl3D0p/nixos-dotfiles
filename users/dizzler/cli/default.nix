{ config, pkgs, ... }:

{
  imports = [
    ./zsh.nix
    ./git.nix
    ./kitty.nix
  ];

  home.packages = with pkgs; [
    neofetch
    ranger
    fzf
    # provides nom, which works like nix, but with better logs
    nix-output-monitor 
    nh

    # monitoring
    htop
    iotop # io
    iftop # network
    tmux

    ffmpeg
    yt-dlp

    R
    python3
  ];
}
