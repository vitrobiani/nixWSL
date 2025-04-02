{ config, pkgs, userSettings, ... }:

{
  home.sessionVariables = {
    PROFILE = userSettings.profile;
    EDITOR = userSettings.editor;
    SPAWNEDITOR = userSettings.spawnEditor;
    TERM = userSettings.term;
    PATH = "$HOME/.HomeFlake/scripts/:$PATH";
    LD_LIBRARY_PATH = builtins.concatStringsSep ":" [
        "${pkgs.xorg.libX11}/lib"
        "${pkgs.libxkbcommon_8}/lib"
        "${pkgs.xorg.libXi}/lib"
        "${pkgs.libGL}/lib"
      ];
  };
}
