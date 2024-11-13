{ pkgs, ... }:

{
  home.packages = with pkgs; [
    brave
    firefox
    mullvad-vpn
    transmission_4-gtk
    vesktop
  ];
}
