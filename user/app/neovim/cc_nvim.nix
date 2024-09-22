{ config, pkgs, userSettings, ... }:

{
  home.file = {
    ".config/nvim" = {
      enable = true;
      source = ./c_nvim;
      recursive = true;
    };
  };
}

