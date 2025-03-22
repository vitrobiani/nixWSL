
    { config, pkgs, userSettings, ... }:

    {
      home.file = {
        ".config/nvim" = {
          enable = true;
          source = ./nvim_nvim;
          recursive = true;
        };
      };
    }
    
