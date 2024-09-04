
{ pkgs, ... }:

{
  home.packages = with pkgs;[
    nodePackages_latest.bash-language-server
    lua
    lua-language-server
    nil
    nixd
    statix
    marksman
  ];


}
