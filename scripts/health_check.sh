#!/bin/bash

pg_isready -h localhost -p 5432

if [ $? -eq 0 ]; then
    echo "PostgreSQL is healthy."
else
    echo "PostgreSQL is unavailable."
    exit 1
fi
