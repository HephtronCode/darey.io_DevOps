#!/bin/bash
# This script generates a multiplication table for a given number

# Ask the user for a number
read -p "Enter a number to generate its multiplication table: " number
# Check if the input is a valid number between 1 and 10
if ! [[ "$number" =~ ^[1-9]$|10$ ]]; then
    echo "Error: Please enter a valid number between 1 and 10."
    exit 1
fi

# Ask the user to specify if they want a full or partial table
read -p "Do you want a full table (1-10) or a partial table (1-10)? (Enter 'f' for full or 'p' for partial): " choice

# Generate the multiplication table based on the user's choice
if [[ "$choice" == "f" ]]; then
    start=1
    end=10
elif [[ "$choice" == "p" ]]; then
    read -p "Enter the start number for the partial table (1-10): " start
    read -p "Enter the end number for the partial table (1-10): " end
    # Check if the input is a valid range between 1 and 10
    if ! [[ "$start" =~ ^[1-9]$|10$ && "$end" =~ ^[1-9]$|10$ && "$start" -le "$end" ]]; then
        echo "Error: Please enter a valid range between 1 and 10."
        exit 1
    fi
else
    echo "Error: Invalid choice. Please enter 'f' for full or 'p' for partial."
    exit 1
fi

# Ask the user if they want the table in ascending or descending order
read -p "Do you want the table in ascending or descending order? (Enter 'asc' or 'desc'): " order

# Generate the multiplication table based on the order
if [[ "$order" == "asc" ]]; then
    echo "Multiplication table for $number ($start-$end) in ascending order:"
    for ((i = start; i <= end; i++)); do
        result=$((number * i))
        echo "$number x $i = $result"
    done
elif [[ "$order" == "desc" ]]; then
    echo "Multiplication table for $number ($start-$end) in descending order:"
    for ((i = end; i >= start; i--)); do
        result=$((number * i))
        echo "$number x $i = $result"
    done
else
    echo "Error: Invalid order choice. Please enter 'asc' or 'desc'."
    exit 1
fi

echo "---------------------------------"
echo "Thank you for using the multiplication table generator!"
echo "---------------------------------"
