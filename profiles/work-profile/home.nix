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

              ../../user/app/gaming/gaming.nix
              ../../user/app/neovim/nvim.nix
              ../../user/app/ranger/ranger.nix
              ../../user/lang/rust.nix
              ../../user/lang/cc.nix
              ../../user/lang/dart.nix
              ../../user/lang/python.nix
              ../../user/lang/editors.nix
              ../../user/shell/term.nix
              ../../user/shell/sh.nix

              ../../system/gnome.nix
              # ../../system/hyprland.nix
            ];

  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.enableNixpkgsReleaseCheck = false;

  home.packages = (with pkgs; [
    brave
    libreoffice

    docker
    hollywood

    vlc
    spotify
    discord


    pkg-config
    udev alsa-lib vulkan-loader
    xorg.libX11 xorg.libXcursor xorg.libXi xorg.libXrandr # To use the x11 feature
    libxkbcommon wayland # To use the wayland feature

    # android-tools
    # android-studio
    #
    # dart
    # flutter
  ]); 


  services.syncthing.enable = true;

  home.sessionVariables = {
    EDITOR = userSettings.editor;
    VISUAL = userSettings.editor;
    SPAWNEDITOR = userSettings.spawnEditor;
    TERM = userSettings.term;
  };

  news.display = "silent";

}
