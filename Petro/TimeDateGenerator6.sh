#!/bin/bash

start_date="2023-01-01 00:00:00"  # Current date in your example
end_date=$(date -d "$start_date +6 months" '+%Y-%m-%d %H:%M:%S')
echo "End Date: $end_date"

current_date="$start_date"
output_file="datetime_table.txt"

# Clear output file if it exists
> "$output_file"

while [[ $(date -d "$current_date" +%s) -le $(date -d "$end_date" +%s) ]]; do

    input_file="Generator.txt"
    while IFS= read -r line; do
        IFS=',' read -r key value <<< "$line"
        parameter_name="${key#*=}"
        command=$($value)
        # Append the current date/time to the output file
        echo "$current_date","$parameter_name","$command" >> "$output_file"
    done < "$input_file"
    
    echo "----------------------round end -------------------------------------------------------"
    
    # Increment current_date by 5 minutes
    current_date=$(date -d "$current_date +5 minutes" '+%Y-%m-%d %H:%M:%S %z')
    
done


