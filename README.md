# DBOps Homework 1

- project lives [here](https://github.com/Fr0stFree/DevOpsDBOps-Homework1)

## Steps

1. Create new db with owner
```sql
CREATE ROLE chief WITH LOGIN PASSWORD 'sosyska';
CREATE DATABASE store WITH OWNER chief;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO chief;
```

2. Display sausages sold in the last 7 days
```sql
SELECT
	CASE EXTRACT(DOW FROM date_created)
        WHEN 0 THEN 'Sunday'
        WHEN 1 THEN 'Monday'
        WHEN 2 THEN 'Tuesday'
        WHEN 3 THEN 'Wednesday'
        WHEN 4 THEN 'Thursday'
        WHEN 5 THEN 'Friday'
        WHEN 6 THEN 'Saturday'
    END AS day_of_week,
    SUM(op.quantity) AS amount
FROM orders o
JOIN order_product op ON o.id = op.order_id
WHERE status = 'shipped' AND NOW() - date_created  <= '7 days'::INTERVAL
GROUP BY EXTRACT(DOW FROM date_created)
ORDER BY EXTRACT(DOW FROM date_created)
```