#!/bin/bash

#start_date="2024-02-01 07:00:00"
#end_date=$(date -d "$start_date +3 months" '+%Y-%m-%d %H:%M:%S')

start_date="2025-01-29 17:00:00"  # Current date in your example
end_date=$(date -d "$start_date +6 months" '+%Y-%m-%d %H:%M:%S')
echo $end_date



current_date="$start_date"
output_file="datetime_table.txt"

while [[ $(date -d "$current_date" +%s) -le $(date -d "$end_date" +%s) ]]; do

    input_file="Generator.txt"
    while IFS= read -r line; do
        IFS=',' read -r key value <<< "$line"
        parameter_name="${key#*=}"
        command=$($value)
        # Append the current date/time to the output file
        echo "$current_date","$parameter_name","$command" >> $output_file
    done < "$input_file"
    echo "----------------------round end -------------------------------------------------------"
current_date=$(date -d "$current_date +5 minute" '+%Y-%m-%d %H:%M:%S %z')
    
done

