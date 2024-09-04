#! /bin/sh

# Directory containing the files
DIRECTORY=/home/nixos/.HomeFlake/user/lang/Makefiles # THIS IS NOT DYNMIC AND WILL NOT WORK IF YOUR USERNAME IS NOT nixos
# FOR SOME REASON THIS WON'T WORK WITH ~ OR $HOME

# List all files in the directory
FILES=($(ls -p $DIRECTORY | grep -v /))

# Print the second row of each file
echo "Here are the second rows of each file:"
for i in "${!FILES[@]}"; do
  FILE="${FILES[$i]}"
  SECOND_LINE=$(sed -n '2p' "$DIRECTORY/$FILE")
  echo "$((i + 1)). $SECOND_LINE"
done

# Prompt the user to select a file
echo "Please choose a file to copy by entering its number:"
read -r choice

# Validate the user's choice
if [ "$choice" -ge 1 ] && [ "$choice" -le "${#FILES[@]}" ]; then
  SELECTED_FILE="${FILES[$((choice - 1))]}"
  cp "$DIRECTORY/$SELECTED_FILE" ./Makefile
  echo "File '$SELECTED_FILE' has been copied to the current directory as Makefile."
else
  echo "Invalid choice. Exiting."
fi
