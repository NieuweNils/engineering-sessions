### Write a transaction to:
  
- Update the prices of the albums with 15% inflation

- archive the 1000 oldest transactions to a .csv file
  - find the oldest records
  - write them to a csv
  - delete them from the transactions table

- expand the amount of characters that fit in the artists biography to 200 characters:
  - create temporary tables for the data that references the artist table
  - store the data that would get corrupted
  - truncate the artist table
  - alter the bio column
  - put back all the data (in the right order)
