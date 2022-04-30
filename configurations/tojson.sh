#!/bin/env sh

# Install dhall-to-json and add it to your path.

for file in "$@"; do
    dhall-to-json \
    --compact \
    --file "$file" \
    --output "$file.json"
done