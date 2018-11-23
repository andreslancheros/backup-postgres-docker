#!/bin/bash
# Small script to take postgres backup by using docker container

postgres_version=10
postgres_username=postgres
postgres_password=password
postgres_host=127.0.0.1
postgres_port=5432
postgres_dbname=dbname
path_to_store_backup=/home

docker run -it postgres:$postgres_version pg_dump --dbname=postgresql://$postgres_username:$postgres_password@$postgres_host:$postgres_port/$postgres_dbname | gzip > /$path_to_store_backup/"$postgres_dbname"_$(date +%Y-%m-%d).psql.gz
