
{ config, pkgs, userSettings, ... }:

{

  imports = [
              ../../user/shell/sh.nix # My zsh and bash config
              ../../user/shell/cli-collection.nix # Useful CLI apps
              ../../user/app/git/git.nix # My git config
              ../../user/lang/language-servers.nix # C and C++ tools
            ];
}
