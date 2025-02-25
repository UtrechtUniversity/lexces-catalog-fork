#!/bin/bash
#
# This script backs up data from the containerized Lexces catalog

STAGINGDIR="$1"

if [ -z "$STAGINGDIR" ]
then echo "No staging dir provided. Setting it to current working directory."
     STAGINGDIR="."
fi

docker exec ckan /bin/bash -c "cd /etc/ckan; tar cv default" | gzip -9 > "${STAGINGDIR}/ckan-settings.tar.gz"
docker exec ckan /bin/bash -c "PGPASSWORD=\"\$POSTGRES_PASSWORD\" pg_dump -d ckan_default -h db -U ckan" | gzip -9 > "${STAGINGDIR}/ckan-db.sql.gz"
