#!/bin/bash

# ============================================================================
# ======================== AWS RESOURCE TEARDOWN SCRIPT ======================
# ============================================================================
#  WARNING: This script is DESTRUCTIVE and will terminate EC2 instances
#           and delete S3 buckets created by the provisioning script.
# ============================================================================

echo "🛑 WARNING: This script will permanently delete AWS resources."
read -p "   Are you sure you want to continue? (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1 # handle exits from shell or sourced script
fi

terminate_ec2_instances() {
    local key_name="MyKeyPair"
    local region="eu-west-2"

    echo ""
    echo "--- Finding and Terminating EC2 Instances with Key: $key_name ---"

    # Find instance IDs that are in 'running' or 'pending' state with the specific key pair.
    # The --query parameter uses JMESPath to filter the JSON output from AWS.
    # The --output text gives us a clean, space-separated list of IDs.
    instance_ids=$(aws ec2 describe-instances \
        --region "$region" \
        --filters "Name=key-name,Values=$key_name" "Name=instance-state-name,Values=running,pending" \
        --query "Reservations[].Instances[].InstanceId" \
        --output text)

    # Check if we found any instances to terminate. The '-z' flag checks for an empty string.
    if [ -z "$instance_ids" ]; then
        echo "INFO: No running EC2 instances found with the key '$key_name'."
        return
    fi

    echo "INFO: Found instances to terminate: $instance_ids"

    # Terminate the found instances.
    aws ec2 terminate-instances --region "$region" --instance-ids $instance_ids

    if [ $? -eq 0 ]; then
        echo "SUCCESS: Termination command sent for instances: $instance_ids"
        echo "         (Note: It may take a few minutes for instances to fully terminate)"
    else
        echo "ERROR: Failed to terminate EC2 instances."
    fi
}

delete_s3_buckets() {
    local bucket_prefix="datawise-"

    echo ""
    echo "--- Finding and Deleting S3 Buckets with prefix: $bucket_prefix ---"

    # List all buckets and filter them in a loop.
    all_buckets=$(aws s3api list-buckets --query "Buckets[].Name" --output text)

    for bucket in $all_buckets; do
        # Check if the bucket name matches our provisioning pattern.
        # We use a wildcard (*) to match our naming convention.
        if [[ $bucket == ${bucket_prefix}* ]]; then
            echo "INFO: Found matching bucket to delete: $bucket"

            # IMPORTANT: To delete a non-empty bucket, we use the `s3 rb` (remove bucket)
            # command with the --force flag. This deletes all objects first, then the bucket.
            aws s3 rb "s3://${bucket}" --force

            if [ $? -eq 0 ]; then
                echo "SUCCESS: Bucket '$bucket' and all its contents have been deleted."
            else
                echo "ERROR: Failed to delete bucket '$bucket'."
            fi
        fi
    done
}

# Main execution starts here
echo "🚀 Starting AWS Resource Teardown Script..."

terminate_ec2_instances
delete_s3_buckets
