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


    # Various dev packages
    zellij
    texinfo
    libffi zlib
    nodePackages.ungit
    ventoy

    python3
    tree-sitter
    nodejs_22
  ]); 
}
