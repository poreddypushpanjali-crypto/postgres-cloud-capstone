#!/bin/bash

set -e

mkdir -p backups

TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

pg_dump -h localhost -U postgres -d retaildb \
    > "backups/retaildb_${TIMESTAMP}.sql"

echo "Backup created successfully."
echo "File: backups/retaildb_${TIMESTAMP}.sql"
