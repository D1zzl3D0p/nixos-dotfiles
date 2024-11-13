{ config, pkgs, ... }:

# install and enable gnome as the desktop manager

{
  services.xserver = {
    enable = true;
    desktopManager.gnome.enable = true;

    xkb = {
      layout = "us";
      variant = "";
    };
    
  };

  # workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;
}
