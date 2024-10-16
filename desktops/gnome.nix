{ config, pkgs, ... }:

# install and enable gnome as the desktop manager

{
  # enable X11
  services.xserver.enable = true;

  # set up keyboard for X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.xserver.desktopManager.gnome.enable = true;
}
