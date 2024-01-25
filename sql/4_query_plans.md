## let's talk about this stuff:
```
EXPLAIN  WITH albums_ordered_by_price AS (  
SELECT
artist_id,
ROW_NUMBER() OVER (ORDER BY price ASC) AS price_order,
RANK() OVER (ORDER BY price ASC)       AS rank,
DENSE_RANK() OVER (ORDER BY price ASC) AS dense_rank,
price
FROM pl.albums
)
SELECT
art.name,
prices.price,
prices.price_order,
prices.rank,
prices.dense_rank
FROM pl.artists              AS art
JOIN albums_ordered_by_price AS prices 
ON prices.artist_id = art.id
WHERE dense_rank = 1;

┌────────────────────────────────────────────────────────────────────────────────────────┐
│                                       QUERY PLAN                                       │
├────────────────────────────────────────────────────────────────────────────────────────┤
│ Nested Loop  (cost=3.52..13.71 rows=1 width=249)                                       │
│   ->  Subquery Scan on prices  (cost=3.37..5.47 rows=1 width=35)                       │
│         Filter: (prices.dense_rank = 1)                                                │
│         ->  WindowAgg  (cost=3.37..4.72 rows=60 width=35)                              │
│               ->  Sort  (cost=3.37..3.52 rows=60 width=11)                             │
│                     Sort Key: albums.price                                             │
│                     ->  Seq Scan on albums  (cost=0.00..1.60 rows=60 width=11)         │
│   ->  Index Scan using artists_pkey on artists art  (cost=0.14..8.16 rows=1 width=222) │
│         Index Cond: (id = prices.artist_id)                                            │
└────────────────────────────────────────────────────────────────────────────────────────┘
(9 rows)
```

![img.png](images%2Fimg.png)

(disclaimer: chatGPT told me this)

A PostgreSQL query plan can involve various operations, and the specific operations present in a plan depend on the nature of the query, the tables involved, and the conditions specified. Some of the common operations that you might encounter in a PostgreSQL query plan include:

1. Seq Scan (Sequential Scan): This operation involves scanning the entire table sequentially, row by row, to find the matching rows.

1. Index Scan: It involves scanning an index on one or more columns to locate the relevant rows in the table efficiently.

1. Bitmap Index Scan: This operation is similar to Index Scan, but it's often used when multiple indexes need to be combined to filter rows.

1. Bitmap Heap Scan: This operation is used in conjunction with Bitmap Index Scan and involves fetching the actual rows from the table using a bitmap of row IDs.

1. Nested Loop: This operation is used for joining tables. It involves iterating over each row in the outer table and searching for matching rows in the inner table.

1. Merge Join: This is a type of join operation that involves sorting and then merging two pre-sorted input streams.

1. Hash Join: It involves building a hash table from the inner input and then probing it with each row from the outer input to find matches.

1. Aggregate: This operation is used for grouping and aggregating data, such as calculating the sum, average, count, etc.

1. Sort: Sorting operations may be needed for ORDER BY clauses or when performing certain types of joins.

1. Limit: It's used to restrict the number of rows returned by a query.

1. Subquery Scan: This operation is used when a subquery is present, and the results of the subquery need to be processed.

1. HashAggregate: Similar to Aggregate, but used when a hash-based approach is more efficient.

1. Index Only Scan: This operation is used when all the required columns are present in the index, and there's no need to fetch additional data from the table.