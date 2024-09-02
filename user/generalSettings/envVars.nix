{ config, pkgs, userSettings, ... }:

{
  home.sessionVariables = {
    PROFILE = userSettings.profile;
    EDITOR = userSettings.editor;
    SPAWNEDITOR = userSettings.spawnEditor;
    TERM = userSettings.term;
  };
}
