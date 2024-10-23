# Oracle Dockerfile
FROM areusfundaciobit/oracle11

# SQL 파일 복사 (숫자를 붙여서 순서 지정)
COPY 01_create_user.sql /docker-entrypoint-initdb.d/
COPY 02_create_tables.sql /docker-entrypoint-initdb.d/
COPY 03_create_triggers.sql /docker-entrypoint-initdb.d/
