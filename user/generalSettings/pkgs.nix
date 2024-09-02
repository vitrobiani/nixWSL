{ config, pkgs, userSettings, ... }:

{
  home.packages = (with pkgs; [
    hello
    # Core
    zsh
    alacritty
    git
    ranger
    xclip
    syncthing
    lua
    lua-language-server


    # Various dev packages
    nil
    nixd
    statix
    zellij
    texinfo
    libffi zlib
    nodePackages.ungit
    ventoy
  ]); 
}
