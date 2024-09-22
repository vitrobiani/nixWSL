#! /bin/sh

cur=$(pwd)

cd ~/.HomeFlake/profiles/ || exit

# list all items in the current directory
echo "profiles: "
for file in *; do
    modified_fname="${file%%-*}"
    echo "  - $modified_fname"
done

# ask the user for a folder name
read -p "enter the name of a profile:  " foldername

# check if the input is a valid folder
if [ -d "${foldername}-profile" ]; then
# define the file and the identifier
    file=~/.HomeFlake/flake.nix
    identifier="# profileID"
    new_text="        profile = \"${foldername}-profile\"; # profileID"

    # use sed to replace the line containing the identifier
    sed -i "/$identifier/c\\$new_text" "$file"
    git add -A && home-manager switch --flake ~/.HomeFlake
    export PROFILE="${foldername}-profile"
    echo "$PROFILE"
    echo "'$foldername' is will be the active profile in the next session!" | cowsay
else
    echo "'$foldername' is not a valid folder."
fi

cd "$cur" || exit
