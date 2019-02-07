FROM postgres:latest
RUN mkdir -p /tmp/psql_data/
COPY main.sql /tmp/psql_data/
COPY init.sh /docker-entrypoint-initdb.d/

