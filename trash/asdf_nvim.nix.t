
    { config, pkgs, userSettings, ... }:

    {
      home.file = {
        ".config/nvim" = {
          enable = true;
          source = ./asdf_nvim;
          recursive = true;
        };
      };
    }
    
