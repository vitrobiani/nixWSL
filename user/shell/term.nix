{ pkgs, ... }:
{
  home.packages = with pkgs; [ 
    kitty
  ];

  home.file = {
    ".config/kitty.conf" = {
      enable = true;
      source = ./kitty_conf;
    };
  };
}
