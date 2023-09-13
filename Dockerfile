FROM mysql:latest

COPY 00_create_database.sql /docker-entrypoint-initdb.d/
COPY 01_create_user.sql /docker-entrypoint-initdb.d/
COPY 02_create_schema.sql /docker-entrypoint-initdb.d/
COPY 03_insert_data.sql /docker-entrypoint-initdb.d/

ENV MYSQL_DATABASE=model_db
ENV MYSQL_USER=user1
ENV MYSQL_PASSWORD=passwd

RUN sed -i 's/\${MYSQL_DATABASE}/'"${MYSQL_DATABASE}"'/g' /docker-entrypoint-initdb.d/00_create_database.sql && \
    sed -i 's/\${MYSQL_USER}/'"${MYSQL_USER}"'/g' /docker-entrypoint-initdb.d/01_create_user.sql && \
    sed -i 's/\${MYSQL_PASSWORD}/'"${MYSQL_PASSWORD}"'/g' /docker-entrypoint-initdb.d/01_create_user.sql && \
    sed -i 's/\${MYSQL_DATABASE}/'"${MYSQL_DATABASE}"'/g' /docker-entrypoint-initdb.d/01_create_user.sql && \
    sed -i 's/\${MYSQL_DATABASE}/'"${MYSQL_DATABASE}"'/g' /docker-entrypoint-initdb.d/02_create_schema.sql