{ config, pkgs, pkgs-kdenlive, userSettings, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = userSettings.username;
  home.homeDirectory = "/home/"+userSettings.username;

  programs.home-manager.enable = true;

  imports = [
              ../../user/generalSettings/pkgs.nix
              ../../user/generalSettings/imports.nix
              ../../user/generalSettings/envVars.nix

              ../../user/app/neovim/webdev_nvim.nix # My neovim config
              ../../user/lang/wevdev.nix
            ];

  home.stateVersion = "24.11"; # Please read the comment before changing.
home.enableNixpkgsReleaseCheck = false;
home.packages = (with pkgs; [
    elixir
    elixir-ls
    lexical
    tailwindcss
    tailwindcss-language-server
    erlang

# # Core
# zsh
# alacritty
# git
# ranger
# syncthing
# xclip
# lua
# lua-language-server
#
# # Various dev packages
# nil
# nixd
# statix
# zellij
# texinfo
# libffi zlib
# nodePackages.ungit
# ventoy
]); 

  services.syncthing.enable = true;


  home.sessionVariables = {
    EDITOR = userSettings.editor;
    SPAWNEDITOR = userSettings.spawnEditor;
    TERM = userSettings.term;
  };

  news.display = "silent";

}
