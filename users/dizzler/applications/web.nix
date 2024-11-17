{ pkgs, ... }:

{
  home.packages = with pkgs; [
    brave
    firefox

    mullvad-vpn
    tailscale

    transmission_4-gtk

    vesktop
  ];
}
