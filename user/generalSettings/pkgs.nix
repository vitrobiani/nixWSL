{ config, pkgs, userSettings, ... }:

{
  home.packages = (with pkgs; [
    hello
    spotify-cli-linux
    spotify-player
    # Core
    zsh
    alacritty
    git
    ranger
    xclip
    syncthing


    # Various dev packages
    zellij
    helix
    texinfo
    libffi zlib
    nodePackages.ungit
    ventoy

    tree-sitter
    nodejs_22
    nusmv
    glow

    bison
    flex
    gnumake42
  ]); 
}
