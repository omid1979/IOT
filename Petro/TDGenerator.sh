#!/bin/bash

start_date="2024-01-01 00:00:00"
end_date="2024-12-30 23:59:59"

output_file="001.txt"

start_sec=$(date -d "$start_date" +%s)
end_sec=$(date -d "$end_date" +%s)

current_sec=$start_sec

while [ $current_sec -le $end_sec ]; do
    formatted_datetime=$(date -d "@$current_sec" '+%Y-%m-%d %H:%M:%S')
    echo "$formatted_datetime" >> "$output_file"
    current_sec=$((current_sec + 300))
done

total_records=$(wc -l < "$output_file")
echo "Count : $total_records"


