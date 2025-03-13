{ config, pkgs, userSettings, ... }:

{
  home.packages = [ pkgs.git ];
  programs.git.enable = true;
  programs.git.userName = "vitrobiani";
  programs.git.userEmail = "vitrobiani@gmail.com";
  programs.git.extraConfig = {
    init.defaultBranch = "main";
    safe.directory = "/home/" + userSettings.username + "/.dotfiles";
  };
}
