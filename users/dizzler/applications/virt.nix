{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # quickemu
    # quickgui
    gnome-boxes
    virtualbox
  ];
}
