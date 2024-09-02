#! /bin/sh

read -p "Enter the name for the profile:  " filename

cur=$(pwd)

cd ~/.HomeFlake/profiles/ || exit

if [ -d "${filename}-profile" ]; then
    echo "there is already a profile with that name"
else
    cp -r ~/.HomeFlake/profiles/general-profile/ ~/.HomeFlake/profiles/"${filename}-profile"

    cp -r ~/.HomeFlake/user/app/neovim/general_nvim/ ~/.HomeFlake/user/app/neovim/"${filename}_nvim"/

    touch ~/.HomeFlake/user/app/neovim/"${filename}_nvim.nix"

    echo "
    { config, pkgs, userSettings, ... }:

    {
      home.file = {
        \".config/nvim\" = {
          enable = true;
          source = ./${filename}_nvim;
          recursive = true;
        };
      };
    }
    " > ~/.HomeFlake/user/app/neovim/"${filename}_nvim.nix"


    echo "Profile '$filename' has been created" | cowsay
fi

cd "$cur" || exit
