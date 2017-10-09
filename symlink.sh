#!/bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

FILES=$DIR/src/*

for FILE_PATH in $FILES; do
  FILE_NAME=$(basename $FILE_PATH)
  echo "$FILE_PATH -> ~/.$FILE_NAME"
  `ln -sf $FILE_PATH ~/.$FILE_NAME`
done

ln -s ~/dotfiles/bin ~/bin

echo "DONE"
