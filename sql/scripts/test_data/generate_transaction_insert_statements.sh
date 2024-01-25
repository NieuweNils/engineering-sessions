#!/bin/bash

# Output file for INSERT statements
output_file="generate_transactions_inserts.sql"

# Number of transactions to generate
num_transactions=10000

# Function to generate a random transaction
generate_transaction() {
    customer_id=$((1 + RANDOM % 100))  # Assuming 100 customers are generated
    album_id=$((1 + RANDOM % 60))  # Assuming 60 albums are generated

   # Generate a random timestamp within the last 365 days
    timeframe=$((365*24*60*60*40))
    random_factor=$((timeframe/32767))
    random_integer_max=$((RANDOM % (32767))) # 32767 is max random number
    random_timestamp=$((random_integer_max*random_factor))
    purchase_date=$(date -u -v "-$random_timestamp"S +"%Y-%m-%d %H:%M:%S")


    echo "INSERT INTO transactions (customer_id, album_id, purchase_date) VALUES ($customer_id, $album_id, '$purchase_date');"
}

# Generate INSERT statements and write to the output file
echo "-- Generated on $(date)" >> "$output_file"
echo "" >> "$output_file"

for ((i=1; i<=$num_transactions; i++)); do
    generate_transaction >> "$output_file"
done

echo "Generated $num_transactions INSERT statements. See $output_file for details."
