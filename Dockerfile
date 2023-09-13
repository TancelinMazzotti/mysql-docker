FROM mysql:latest

COPY 00_create_database.sql /docker-entrypoint-initdb.d/
COPY 01_create_user.sql /docker-entrypoint-initdb.d/
COPY 02_create_schema.sql /docker-entrypoint-initdb.d/
COPY 03_insert_data.sql /docker-entrypoint-initdb.d/
