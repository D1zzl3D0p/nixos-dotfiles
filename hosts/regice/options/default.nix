
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

  programs = {
    # nixos docs say to do this to enable appimages
    appimage = {
      enable = true;
      binfmt = true;
    };
    # Enable android usb debugging soes I can use my deskthing
    adb.enable = true;
  };

  # Add my user to the adbusers group to do the actual adb things
  users.users.dizzler.extraGroups = ["adbusers"];
  
  # actually need to do this to run appimages
  environment.systemPackages = with pkgs; [
    appimage-run
  ];
}
