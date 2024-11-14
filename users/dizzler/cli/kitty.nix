{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    font.package = pkgs.fira-code;
    theme = "GruvboxMaterialDarkMedium";
  };
}
