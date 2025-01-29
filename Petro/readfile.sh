#!/bin/bash

# Define the input file
input_file="Generator.txt"  # Replace with your actual file name

# Read the file line by line
while IFS= read -r line; do
    # Split the line by '=' and then by ',' to extract values
    IFS=',' read -r key value <<< "$line"
    
    # Further split the key to get the parameter name and its command
    parameter_name="${key#*=}"
    command="${value}"

    # Output the results
    echo "Value One: $parameter_name"
    echo "Value Two: $command"
done < "$input_file"
