#!/bin/sh

cur=$(pwd)

cd ~/.HomeFlake/profiles/ || exit

# list all items in the current directory
echo "profiles: "
for file in *; do
    modified_fname="${file%%-*}"
    echo "  - $modified_fname"
done

# ask the user for a folder name
read -p "enter the name of a profile:  " profilename

# check if the input is a valid folder
if [ -d "${profilename}-profile" ]; then
    read -p "are you sure you want to delete profile ${profilename} <type yes>: " RUSURE

    if [ "$RUSURE" = 'yes' ]; then
        ~/.HomeFlake/trashout.sh
        mv ~/.HomeFlake/profiles/"${profilename}-profile" ~/.HomeFlake/trash/"${profilename}-profile.t" 
        rm -rf ~/.HomeFlake/profiles/"${profilename}-profile"


        mv ~/.HomeFlake/user/app/neovim/"${profilename}_nvim"/ ~/.HomeFlake/trash/"${profilename}_nvim.t"
        rm -rf ~/.HomeFlake/user/app/neovim/"${profilename}_nvim"/

        mv ~/.HomeFlake/user/app/neovim/"${profilename}_nvim.nix" ~/.HomeFlake/trash/"${profilename}_nvim.nix.t"
        rm -rf ~/.HomeFlake/user/app/neovim/"${profilename}_nvim.nix"
        echo "Profile '$profilename' has been deleted"
        echo "(the profile and the neovim directories have been deleted)"
    else
        echo "nothing deleted"
    fi
else
    echo "'$profilename' is not a valid folder."
fi

cd "$cur" || exit
