#!/bin/env sh

# Remove json files from directories.

clean() {
    for file in "$@"; do
        [ ${file%.json} != $file ] && rm $file
    done
}

for dir in "$@"; do
    [ -d $dir ] || echo "$dir: Not a directory."
    [ -d $dir ] && clean $dir/*
done
