{ pkgs, ... }:

{
  imports = [
    # ./hypr
    # ./mako.nix
    # ./fuzzel.nix
    ./games.nix
    ./web.nix
    ./audio-visual.nix
    ./virt.nix
  ];
  home.packages = [
    pkgs.libreoffice
    pkgs.wl-clipboard
    pkgs.filelight
  ];
}
