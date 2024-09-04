{ config, pkgs, userSettings, ... }:
let
  myAliases = {
    cmf = "sudo sh ~/.HomeFlake/user/lang/cmf.sh";
  };
in 

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

              ../../user/app/neovim/cc_nvim.nix # My neovim config
              ../../user/lang/cc.nix # C and C++ tools
            ];

  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.enableNixpkgsReleaseCheck = false;

  home.packages = (with pkgs; [

  ]); 

  services.syncthing.enable = true;

  home.file ={
    "Makefiles" = {
      enable = true;
      source = ../../user/lang/Makefiles;
      recursive = true;
    };

    ".clang-format".text = "
      BasedOnStyle: LLVM
      IndentWidth: 4";
  };

  programs.zsh = {
    enable = true;
    shellAliases = myAliases;
  };

  programs.bash = {
    enable = true;
    shellAliases = myAliases;
  };

  programs.fish = {
    enable = true;
    shellAliases = myAliases;
  };

  home.sessionVariables = {
    EDITOR = userSettings.editor;
    SPAWNEDITOR = userSettings.spawnEditor;
    TERM = userSettings.term;
  };

  news.display = "silent";

}
