#!/bin/sh
set -ex

if [ -d _site ]; then
  rm -r _site
fi
mkdir _site

cd pages

find -type d -exec mkdir -p ../_site/{} \;
find -type f ! -name "*.html" -exec cp {} ../_site/{} \;
html_pages=$(find -type f -name "*.html")

for page in $html_pages; do
  mkdir -p ../_site/content/$(dirname $page)
  cp $page ../_site/content/$page
  cat ../header.html $page ../footer.html > ../_site/$page
done
