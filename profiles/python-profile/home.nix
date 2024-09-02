{ config, pkgs, userSettings, inputs, ... }:

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

              ../../user/app/neovim/python_nvim.nix # My neovim config
              ../../user/lang/python.nix
            ];

  nixpkgs.overlays = [
      inputs.webx.overlays.x86_64-linux.default
  ];

  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.enableNixpkgsReleaseCheck = false;

  home.packages = (with pkgs; [

  ]); 

  services.syncthing.enable = true;


  home.sessionVariables = {
    EDITOR = userSettings.editor;
    SPAWNEDITOR = userSettings.spawnEditor;
    TERM = userSettings.term;
  };

  news.display = "silent";

}
