
    { config, pkgs, userSettings, ... }:

    {
      home.file = {
        ".config/nvim" = {
          enable = true;
          source = ./rust_nvim;
          recursive = true;
        };
      };
    }
    
