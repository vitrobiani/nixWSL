{ config, pkgs, userSettings, ... }:

{
  home.packages = (with pkgs; [
    # hello
    spotify-cli-linux
    spotify-player
    # Core
    zsh
    alacritty
    git
    ranger
    xclip
    syncthing
    baobab
    rembg


    # Various dev packages
    zellij
    helix
    texinfo
    libffi zlib
    nodePackages.ungit

    tree-sitter
    nodejs_22
    nusmv
    glow

    bison
    flex
    gnumake42

    bitwarden-desktop
    wasistlos
    claude-code
  ]); 
}
