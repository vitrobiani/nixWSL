{ config, pkgs, userSettings, ... }:

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

              ../../user/app/neovim/rust_nvim.nix # My neovim config
              ../../user/app/ranger/ranger.nix
              ../../user/lang/rust.nix
              ../../user/lang/cc.nix
              ../../user/lang/python.nix

              ../../system/gnome.nix
              ../../system/hyprland.nix
            ];

  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.enableNixpkgsReleaseCheck = false;

  home.packages = (with pkgs; [
    vscode

    docker
    hollywood

    vlc
    spotify
    discord

    pkg-config
    udev alsa-lib vulkan-loader
    xorg.libX11 xorg.libXcursor xorg.libXi xorg.libXrandr # To use the x11 feature
    libxkbcommon wayland # To use the wayland feature
  ]); 

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

  services.syncthing.enable = true;

  home.sessionVariables = {
    EDITOR = userSettings.editor;
    VISUAL = userSettings.editor;
    SPAWNEDITOR = userSettings.spawnEditor;
    TERM = userSettings.term;
  };

  news.display = "silent";

}
