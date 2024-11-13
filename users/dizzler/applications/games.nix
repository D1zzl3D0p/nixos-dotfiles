{ pkgs, ... }:

{
  home.packages = with pkgs; [
    r2modman # modding with unity
    lumafly # hollow knight modding
    archipelago # randomizers/multiplayer thing
  ];
}
