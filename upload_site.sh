#!/bin/sh
source .serverinfo 

echo "Generating site..."
jekyll --safe

if [[ $? -ne 0 ]]; then
  echo "Could not generate site!"
  exit 1
fi

echo "Uploading to $USER@$HOST:$DESTDIR..."
rsync --progress --compress --recursive --checksum --delete  _site/ $USER@$HOST:$DESTDIR

if [[ $? -eq 0 ]]; then
  echo "Done!"
else
  echo "Errors!"
fi
