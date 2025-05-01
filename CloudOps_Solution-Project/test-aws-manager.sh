#!/bin/bash

# Test Script for AWS IAM Manager

# Define test IAM user names
TEST_IAM_USER_NAMES=("testuser1" "testuser2" "testuser3")

# Create a temporary copy of the main script
TEMP_SCRIPT="temp-aws-iam-manager.sh"
cp aws-iam-manager.sh $TEMP_SCRIPT

# Inject test IAM user names into the temporary script
sed -i "s|IAM_USER_NAMES=()|IAM_USER_NAMES=(${TEST_IAM_USER_NAMES[*]})|" $TEMP_SCRIPT

# Make the temporary script executable
chmod +x $TEMP_SCRIPT

# Run the temporary script
echo "Running the test script..."
./$TEMP_SCRIPT

# Clean up the temporary script
rm -f $TEMP_SCRIPT

echo "Test completed."