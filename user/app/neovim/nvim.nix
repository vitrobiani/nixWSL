{ config, pkgs, userSettings, ... }:

{
  home.file = {
    ".config/nvim" = {
      enable = true;
      source = ./master_nvim;
      recursive = true;
    };
  };
}
