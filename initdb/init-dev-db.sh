#!/bin/bash
set -e
echo "Preparing Postgres ========================================================= "

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
	CREATE USER dev;
	ALTER USER dev WITH PASSWORD 'password';
	CREATE DATABASE pandp;
	GRANT ALL PRIVILEGES ON DATABASE pandp TO dev;
EOSQL

echo "Dev user update"
