#!/bin/bash

# Define the start date using Unix time (Thursday, January 30, 2025, 8 AM +0330)
start_date="2024-01-01 00:00:00 +0330"
start_unix=$(date -d "$start_date" +%s)

#### Output file 
>001.txt
output_file="001.txt"

# Calculate the end date (365 days later)
end_unix=$((start_unix + 365 * 24 * 60 * 60))

# Print every 5 seconds for the next 365 days
current_time=$start_unix

while [ $current_time -le $end_unix ]; do
    # Convert current Unix time to human-readable format
    formatted_time=$(date -d "@$current_time" '+%Y-%m-%d %H:%M:%S %z')
    

    input_file="Generator.txt"
    while IFS= read -r line; do
	IFS=',' read -r key value <<< "$line"
	parameter_name="${key#*=}"
	command=$($value)
    echo "$formatted_time","$parameter_name","$command" >> "$output_file"
    done < "$input_file"


    # Print the formatted time
    echo "Current time: $formatted_time"
    
    # Increment by 5 seconds
    current_time=$((current_time + 300))
    
    # Sleep for a short duration to avoid overwhelming output (optional)
    #sleep 0.1
done


