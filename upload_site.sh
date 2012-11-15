#!/bin/sh
echo "Generating site..."
jekyll

if [[ $? -ne 0 ]]; then
  echo "Could not generate site!"
  exit 1
fi

echo "Uploading..."
rsync --compress --recursive --checksum --delete  _site/ user@host.tld:public_html/

if [[ $? -eq 0 ]]; then
  echo "Done!"
else
  echo "Errors!"
fi
