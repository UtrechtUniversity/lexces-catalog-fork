#!/bin/sh
set -e

cd images

for image in ckan nginx solr mta
do cd "$image"
   echo "Building image $image ..."
   ./build.sh
   cd ..
done

echo "Building images completed."
