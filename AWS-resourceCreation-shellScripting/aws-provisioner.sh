#!/bin/bash

# Validate if aws cli is installed
check_aws_cli() {
    echo "Checking if AWS CLI is installed..."
    if ! command -v aws &>/dev/null; then
        echo "AWS CLI is not installed. Please install it and try again."
        exit 1
    fi
    echo "AWS CLI is installed."
}

# Validate if AWS_PROFILE is set
check_aws_profile() {
    echo "INFO: Checking if AWS_PROFILE is set..."
    # -z check if the $AWS_PROFILE variable is empty
    if [ -z "$AWS_PROFILE" ]; then
        echo "AWS_PROFILE is not set. Please set it and try again."
    else
        echo "AWS_PROFILE is set to '$AWS_PROFILE'."
    fi
}

# Function to check script arguments and determine the environment
activate_infra_environment() {
    # "$#" holds the count of arguments passed to the script.
    if [ "$#" -ne 1 ]; then
        # "$0" is the name of the script itself.
        echo "ERROR: Incorrect number of arguments."
        echo "Usage: $0 <environment>  (e.g., 'local', 'testing', or 'production')"
        exit 1
    fi

    ENVIRONMENT=$1 # Assign the first argument to our variable
    echo "================================================"
    echo "Activating Infrastructure for Environment: $ENVIRONMENT"
    echo "================================================"

    # This 'if' block is just for demonstration. In a real-world scenario,
    # you might load different configuration files based on the environment.
    if [ "$ENVIRONMENT" == "local" ]; then
        echo "-> Running script for Local Environment..."
    elif [ "$ENVIRONMENT" == "testing" ]; then
        echo "-> Running script for Testing Environment..."
    elif [ "$ENVIRONMENT" == "production" ]; then
        echo "-> Running script for Production Environment..."
    else
        echo "ERROR: Invalid environment specified. Use 'local', 'testing', or 'production'."
        exit 2
    fi
}

#----------------------------#
#   CORE LOGIC FUNCTIONS   #
#----------------------------#

create_ec2_instances() {
  echo ""
  echo "--- Starting EC2 Instance Creation ---"
  
  # Using local variables makes the command easier to read and modify.
  local instance_type="t2.micro"
  local ami_id="ami-00f7e79ebcafba5e4" # Amazon Linux 2 AMI for eu-west-2
  local count=1
  local region="eu-west-2"
  local key_name="MyKeyPair"

  aws ec2 run-instances \
    --image-id "$ami_id" \
    --instance-type "$instance_type" \
    --count "$count" \
    --key-name "$key_name" \
    --region "$region"

  # '$?' is a special variable that holds the exit status of the *last* command.
  if [ $? -eq 0 ]; then
    echo "SUCCESS: EC2 instances creation command executed successfully."
  else
    echo "ERROR: Failed to execute EC2 instances creation command."
    # We choose not to exit the whole script, to allow S3 creation to proceed.
  fi

  # Display the list of EC2 instances
  echo "Listing all EC2 instances in region $region:"
  aws ec2 describe-instances --region "$region" --query "Reservations[*].Instances[*].[InstanceId,State.Name,InstanceType,PublicIpAddress]" --output table
    echo "--- Finished EC2 Instance Creation ---"
}

# Function to create an S3 bucket
create_s3_buckets() {
  echo ""
  echo "--- Starting S3 Bucket Creation ---"

  # The company name acts as a unique prefix. S3 bucket names must be globally unique.
  local company="datawise" 
  local region="eu-west-2" # Use the same region for consistency
  
  # Declare an array of department names
  local departments=("Marketing" "Sales" "HR" "Operations" "Media")

  # Loop through each element in the array.
  # "${departments[@]}" is the standard, safe way to expand an array to all its elements.
  for department in "${departments[@]}"; do
    # Sanitize department name and construct the bucket name
    local sanitized_dept=$(echo "$department" | tr '[:upper:]' '[:lower:]')
    local bucket_name="${company}-${sanitized_dept}-data-bucket-$(date +%s)"
    
    echo "INFO: Attempting to create bucket: $bucket_name"
    
    aws s3api create-bucket \
        --bucket "$bucket_name" \
        --region "$region" \
        --create-bucket-configuration LocationConstraint=$region

    if [ $? -eq 0 ]; then
      echo "SUCCESS: S3 bucket '$bucket_name' created."
    else
      echo "ERROR: Failed to create S3 bucket '$bucket_name'."
    fi
  done

    # List all S3 buckets in the account
    echo ""
    echo "INFO: Listing all S3 buckets in the account:"
    # Using the --query option to format the output as a table
    # The --output table option formats the output in a human-readable table format.
    # This command lists all S3 buckets in the account.
  aws s3api list-buckets --query "Buckets[*].Name" --output table
  echo "--- Finished S3 Bucket Creation ---"
}

#----------------------------#
#   MAIN SCRIPT EXECUTION   #
#----------------------------#

#----------------------#
#   MAIN EXECUTION     #
#----------------------#

# The '$@' passes all script arguments to the function
activate_infra_environment "$@" 
check_aws_cli
check_aws_profile
create_ec2_instances
create_s3_buckets

echo ""
echo "✅ Script execution finished."