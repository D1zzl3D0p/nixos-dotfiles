{ config, pkgs, ... }:

{
  hardware = {
    steam-hardware.enable = true;
    pulseaudio.support32Bit = true;
    graphics.enable32Bit = true;
    graphics.enable = true;
  };

  programs.gamescope.enable = true;
  programs.steam.enable = true;

  environment.systemPackages = with pkgs; [
    # random libraries for various games
    icu
    dotnet-sdk # never been able to get this to work
    faudio # helps with audio glitching in helldivers 2

    # wine
    wineWowPackages.stable
    winetricks
  ];
}
