{ config, pkgs, userSettings, ... }:

{
  home.file = {
    ".config/nvim" = {
      enable = true;
      source = ./cc_nvim;
      recursive = true;
    };
  };
}

