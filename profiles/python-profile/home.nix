{ config, pkgs, pkgs-kdenlive, userSettings, inputs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = userSettings.username;
  home.homeDirectory = "/home/"+userSettings.username;

  programs.home-manager.enable = true;

  imports = [
              ../../user/shell/sh.nix # My zsh and bash config
              ../../user/shell/cli-collection.nix # Useful CLI apps
              ../../user/app/neovim/python_nvim.nix # My neovim config
              #../../user/app/ranger/ranger.nix # My ranger file manager config
              ../../user/app/git/git.nix # My git config
              #../../user/lang/cc/cc.nix # C and C++ tools
              ../../user/lang/python.nix
            ];

  nixpkgs.overlays = [
      inputs.webx.overlays.x86_64-linux.default
  ];

  home.stateVersion = "24.11"; # Please read the comment before changing.
  home.enableNixpkgsReleaseCheck = false;

  home.packages = (with pkgs; [
    hello
    # Core
    zsh
    alacritty
    git
    ranger
    syncthing
    xclip

    #dev
    

    # Various dev packages
    nil
    nixd
    statix
    zellij
    texinfo
    libffi zlib
    nodePackages.ungit
    ventoy
    webx
  ]); 

  services.syncthing.enable = true;


  home.sessionVariables = {
    EDITOR = userSettings.editor;
    SPAWNEDITOR = userSettings.spawnEditor;
    TERM = userSettings.term;
  };

  news.display = "silent";

}
