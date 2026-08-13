#!/bin/bash

set -e

if [ -z "$1" ]; then
    echo "Usage: ./restore.sh <backup.sql>"
    exit 1
fi

psql -h localhost -U postgres -d retaildb < "$1"

echo "Database restore completed successfully."
