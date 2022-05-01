#!/bin/env sh

# Create json files from dhall files from directories.
# Install dhall-to-json and add it to your path.

tojson() {
    for file in "$@"; do
        [ ${file%.dhall} != $file ] && dhall-to-json \
        --compact \
        --file "$file" \
        --output "$file.json"
    done
}

for dir in "$@"; do
    [ -d $dir ] || echo "$dir: Not a directory."
    [ -d $dir ] && tojson $dir/*
done
