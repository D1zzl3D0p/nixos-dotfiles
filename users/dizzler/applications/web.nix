{ pkgs, ... }:

{
  home.packages = with pkgs; [
    brave
    firefox
    chromium

    mullvad-vpn
    # tailscale

    transmission_4-gtk

    vesktop
  ];
}
