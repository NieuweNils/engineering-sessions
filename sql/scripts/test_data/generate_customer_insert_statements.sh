#!/bin/bash

# Output file for INSERT statements
output_file="test_customers.sql"

# Number of records to generate
num_records=100

# Function to generate a random name
generate_name() {
    first_names=("John" "Haruto" "Olivia" "Liam" "Anika" "Vihaan" "Enzo" "Kaito" "Hinata" "Emma")
    last_names=("Smith" "Lefevre" "Suzuki" "Jones" "Watanabe" "Davis" "Santos" "Wilson" "Patel" "Taylor")
    echo "${first_names[$((RANDOM % 10))]} ${last_names[$((RANDOM % 10))]}"
}

# Function to generate a random email (using random UUIDs)
generate_email() {
    echo "$(uuidgen)@example.com"
}

# Generate INSERT statements and write to the output file
echo "-- generate_customers_inserts.sql" > "$output_file"
echo "-- Generated on $(date)" >> "$output_file"
echo "" >> "$output_file"

for ((i=1; i<=$num_records; i++)); do
    name=$(generate_name $i)
    email=$(generate_email)
    phone_number="+1234567890"
    address="Address $i"

    echo "INSERT INTO customers (name, email, phone_number, address) VALUES ('$name', '$email', '$phone_number', '$address');" >> "$output_file"
done

echo "Generated $num_records INSERT statements. See $output_file for details."
