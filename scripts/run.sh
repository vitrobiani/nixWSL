#! /bin/sh

# Prompt the user for the executable file name
read -p "Enter the name of the executable file: " executable

# Prompt the user for the number of times to run the executable
read -p "Enter the number of times to run the executable: " count

# Run the executable the specified number of times
for ((i=1; i<=count; i++))
do
    ./$executable
done
