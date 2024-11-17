{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    font.package = pkgs.fira-code;
    font.name = "Fira Code";
    themeFile = "GruvboxMaterialDarkMedium";
  };
}
