#!/bin/bash

# AWS IAM Manager Script for CloudOps Solutions
# This script automates the creation of IAM users, groups, and permissions

set -e  # Exit immediately if a command exits with a non-zero status

# Define the IAM User Names Array
# Example: IAM_USER_NAMES=("user1" "user2" "user3")
IAM_USER_NAMES=()

# Function to create IAM users
create_iam_users() {
    echo "Starting IAM user creation process..."
    echo "_____________________________________"
    for user in "${IAM_USER_NAMES[@]}"; do
        echo "Creating IAM user: $user"
        aws iam create-user --user-name "$user" >/dev/null 2>&1
        if [[ $? -eq 0 ]]; then
            echo "IAM user $user created successfully."
        else
            echo "Error: Failed to create IAM user $user."
        fi
        echo "_____________________________________"
        echo ""
    done
}

# Function to create IAM group
create_admin_group() {
    echo "Creating admin group and attaching policy..."
    echo "--------------------------------------------"

    if ! aws iam get-group --group-name "admin" >/dev/null 2>&1; then
        aws iam create-group --group-name "admin"
        echo "Admin group created."
    else
        echo "Admin group already exists."
    fi

    # Attaching the AdministratorAccess policy to the admin group
    echo "Attaching AdministratorAccess policy..."
    aws iam attach-group-policy \
        --group-name "admin" \
        --policy-arn arn:aws:iam::aws:policy/AdministratorAccess

    if [[ $? -eq 0 ]]; then
        echo "Success: AdministratorAccess policy attached."
    else
        echo "Error: Failed to attach AdministratorAccess policy."
    fi

    echo "----------------------------------"
    echo ""
}

# Function to add users to the admin group
add_users_to_admin_group() {
    echo "Adding users to admin group..."
    echo "------------------------------"

    for user in "${IAM_USER_NAMES[@]}"; do
        echo "Adding $user to admin group..."
        aws iam add-user-to-group \
            --user-name "$user" \
            --group-name "admin"

        if [[ $? -eq 0 ]]; then
            echo "Success: $user added to admin group."
        else
            echo "Error: Failed to add $user to admin group."
        fi
    done

    echo "----------------------------------------"
    echo "User group assignment process completed."
    echo ""
}

# Main function to call all other functions
main() {
    echo "=================================="
    echo " AWS IAM Management Script"
    echo "=================================="
    echo ""

    # Check if AWS CLI is installed
    if ! command -v aws &>/dev/null; then
        echo "Error: AWS CLI is not installed."
        echo "Please install it from https://aws.amazon.com/cli/ and configure it using 'aws configure'."
        exit 1
    fi

    # Ensure IAM_USER_NAMES is not empty
    if [[ ${#IAM_USER_NAMES[@]} -eq 0 ]]; then
        echo "Error: IAM_USER_NAMES array is empty. Please populate it with user names."
        exit 1
    fi

    create_iam_users
    create_admin_group
    add_users_to_admin_group

    echo "=================================="
    echo " AWS IAM Management Completed"
    echo "=================================="
}

main
# End of the script
exit 0





