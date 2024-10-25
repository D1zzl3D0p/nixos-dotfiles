
{ config, pkgs, ... }:

{
  imports = 
    [
      ./gnome.nix
    ];

  # enable sound with pipewire
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # enable xdg desktop portals
  xdg.portal.enable = true;

}
