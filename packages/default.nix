
{ config, pkgs, ... }:

{
  imports = [];

  environment.systemPackages = with pkgs [
    vesktop
    easyeffects
    helvum
  ];
  
  programs = {
    firefox.enable = true;
  };
  services = {
    mullvad-vpn.enable = true;
    transmission.enable = true;
  };


}
