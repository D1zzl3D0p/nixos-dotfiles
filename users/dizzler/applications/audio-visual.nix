{ pkgs, ... }:

{
  home.packages = with pkgs; [
    easyeffects
    helvum
    spotifywm
    obs-studio
  ];
}
