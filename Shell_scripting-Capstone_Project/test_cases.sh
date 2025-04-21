#!/bin/bash
# This script tests the multiplication table generator script
# It checks for valid inputs and expected outputs
# Usage: ./test_cases.sh

# Define the script to be tested
SCRIPT="./multiplication_table.sh"

# Define the expected output for a full table
EXPECTED_OUTPUT_FULL="Multiplication table for 5 (1-10) in ascending order:
5 x 1 = 5
5 x 2 = 10
5 x 3 = 15
5 x 4 = 20
5 x 5 = 25
5 x 6 = 30
5 x 7 = 35
5 x 8 = 40
5 x 9 = 45
5 x 10 = 50
---------------------------------
Thank you for using the multiplication table generator!
---------------------------------"

# Define the expected output for a partial table
EXPECTED_OUTPUT_PARTIAL="Multiplication table for 5 (3-7) in ascending order:
5 x 3 = 15
5 x 4 = 20
5 x 5 = 25
5 x 6 = 30
5 x 7 = 35
---------------------------------
Thank you for using the multiplication table generator!
---------------------------------"

# Define the expected output for a descending order table
EXPECTED_OUTPUT_DESCENDING="Multiplication table for 5 (1-10) in descending order:
5 x 10 = 50
5 x 9 = 45
5 x 8 = 40
5 x 7 = 35
5 x 6 = 30
5 x 5 = 25
5 x 4 = 20
5 x 3 = 15
5 x 2 = 10
5 x 1 = 5
---------------------------------
Thank you for using the multiplication table generator!
---------------------------------"

# Function to run a test case
run_test() {
    local input="$1"
    local expected_output="$2"
    local actual_output

    # Run the script with the provided input and capture the output
    actual_output=$(echo -e "$input" | $SCRIPT)

    # Compare the actual output with the expected output
    if [[ "$actual_output" == "$expected_output" ]]; then
        echo "Test passed!"
    else
        echo "Test failed!"
        echo "Expected:"
        echo "$expected_output"
        echo "Actual:"
        echo "$actual_output"
    fi
}

# Test case 1: Full table for number 5
input1="5\nf\nasc\n"
run_test "$input1" "$EXPECTED_OUTPUT_FULL"

# Test case 2: Partial table for number 5 from 3 to 7
input2="5\np\nasc\n3\n7\n"
run_test "$input2" "$EXPECTED_OUTPUT_PARTIAL"

# Test case 3: Descending order table for number 5
input3="5\nf\ndesc\n"
run_test "$input3" "$EXPECTED_OUTPUT_DESCENDING"

# Test case 4: Invalid number input
input4="11\nf\nasc\n"
expected_output4="Error: Please enter a valid number between 1 and 10."
actual_output4=$(echo -e "$input4" | $SCRIPT)
if [[ "$actual_output4" == *"$expected_output4"* ]]; then
    echo "Test passed for invalid number input!"
else
    echo "Test failed for invalid number input!"
    echo "Expected:"
    echo "$expected_output4"
    echo "Actual:"
    echo "$actual_output4"
fi

# Test case 5: Invalid range for partial table
input5="5\np\nasc\n0\n11\n"
expected_output5="Error: Please enter a valid range between 1 and 10."
actual_output5=$(echo -e "$input5" | $SCRIPT)
if [[ "$actual_output5" == *"$expected_output5"* ]]; then
    echo "Test passed for invalid range input!"
else
    echo "Test failed for invalid range input!"
    echo "Expected:"
    echo "$expected_output5"
    echo "Actual:"
    echo "$actual_output5"
fi

# Test case 6: Invalid order input
input6="5\nf\ninvalid_order\n"
expected_output6="Error: Invalid order choice. Please enter 'asc' or 'desc'."
actual_output6=$(echo -e "$input6" | $SCRIPT)
if [[ "$actual_output6" == *"$expected_output6"* ]]; then
    echo "Test passed for invalid order input!"
else
    echo "Test failed for invalid order input!"
    echo "Expected:"
    echo "$expected_output6"
    echo "Actual:"
    echo "$actual_output6"
fi

# Test case 7: Edge case for partial table (start = 1, end = 10)
input7="5\np\nasc\n1\n10\n"
run_test "$input7" "$EXPECTED_OUTPUT_FULL"

# Test case 8: Edge case for partial table (start = end = 5)
input8="5\np\nasc\n5\n5\n"
expected_output8="Multiplication table for 5 (5-5) in ascending order:
5 x 5 = 25
---------------------------------
Thank you for using the multiplication table generator!
---------------------------------"
run_test "$input8" "$expected_output8"
