#!/bin/bash

# Define the input file
input_file="Generator.txt" 

# Define the start date and time
start_date="2024-11-01 07:00:00"

# Define the end date (3 months later)
end_date=$(date -d "$start_date +2 months" '+%Y-%m-%d %H:%M:%S')

# Initialize the current date to the start date
current_date="$start_date"

# Output file for the date/time table
output_file="datetime_table.txt"

# Clear the output file if it exists
#> "$output_file"

# Generate date/time table every 1 minute
while [[ $(date -d "$current_date" +%s) -le $(date -d "$end_date" +%s) ]]; do
    while IFS= read -r line; do
    IFS=',' read -r key value <<< "$line"
    parameter_name="${key#*=}"
    command=$($value)
    # Append the current date/time to the output file
    echo "$current_date","$parameter_name","$command"
    done < "$input_file"
    # Increment the current date by 1 minute
    current_date=$(date -d "$current_date +5 minute" '+%Y-%m-%d %H:%M:%S %z')
    
done

#echo "Date/time table generated in $output_file"
