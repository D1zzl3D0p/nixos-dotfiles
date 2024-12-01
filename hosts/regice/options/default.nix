
{ config, pkgs, ... }:

{
  imports = 
    [
      ./gnome.nix
      ./steam.nix
      ./cosmic.nix
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

  # get easy effects to work
  programs.dconf.enable = true;

  # enable services
  services = {
    # enable CUPS
    printing.enable = true;
    xserver.displayManager.gdm.enable = true;
    # enable mullvad daemon
    mullvad-vpn.enable = true;
    tailscale.enable = true;
  };

  programs.appimage = {
    enable = true;
    binfmt = true;
  };
  
  environment.systemPackages = with pkgs; [
    appimage-run
  ];
}
