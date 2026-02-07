
{ pkgs, ... }:

{
  home.packages = with pkgs;[
    vscode
    # jetbrains.idea-community-src
    android-studio
  ];
    
}






