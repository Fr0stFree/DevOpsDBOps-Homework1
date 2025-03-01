# dbops-project

## Steps

1. Create new db with owner
```sql
CREATE ROLE chief WITH LOGIN PASSWORD 'sosyska';
CREATE DATABASE store WITH OWNER chief;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO chief;
```