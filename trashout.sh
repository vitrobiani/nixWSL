#! /bin/sh

for file in ~/.HomeFlake/trash/*; do
    rm -rf "$file"
    echo "removed $file"
done
