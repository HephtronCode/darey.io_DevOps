# Shell Scripting Use of Functions
Functions are essential in shell scripting for modularity and reusability. They allow you to encapsulate code into reusable blocks, making your scripts cleaner and easier to maintain. Below is a guide on how to define and use functions in shell scripts, with a focus on robust error handling and validation.

## Defining a Function
To define a function, use the following syntax:
```bash
function_name() {
    # code to be executed
    # return values for error handling
}
```

## Calling a Function
To call a function and handle its return value:
```bash
if ! function_name; then
    echo "Function failed with error code $?"
    exit 1
fi
```

## Case Study: DataWise Solution's Client
In this case study, we will create a comprehensive shell script that demonstrates proper function implementation, error handling, and validation. The script will:

1. Validate script arguments with proper error handling
2. Check AWS CLI installation and version compatibility
3. Validate AWS credentials and profile configuration
4. Implement proper execution order validation
5. Include comprehensive error handling
6. Provide testing capabilities

## Implementation

### 1. Argument Validation Function
```bash
#!/bin/bash

validate_arguments() {
    local expected_args=$1
    shift
    local actual_args=$#

    if [ "$actual_args" -ne "$expected_args" ]; then
        echo "Error: Expected $expected_args argument(s), but received $actual_args"
        echo "Usage: $0 <environment>"
        return 1
    fi

    local environment=$1
    case "$environment" in
        "local"|"testing"|"production")
            echo "Valid environment: $environment"
            return 0
            ;;
        *)
            echo "Error: Invalid environment '$environment'"
            echo "Valid environments are: local, testing, production"
            return 1
            ;;
    esac
}
```

### 2. AWS CLI Validation Function
```bash
#!/bin/bash

check_aws_cli() {
    # Check if AWS CLI is installed
    if ! command -v aws &> /dev/null; then
        echo "Error: AWS CLI is not installed"
        echo "Please install AWS CLI version 2.x or higher"
        return 1
    fi

    # Check AWS CLI version
    local aws_version
    aws_version=$(aws --version 2>&1 | cut -d' ' -f1 | cut -d'/' -f2)
    local major_version
    major_version=$(echo "$aws_version" | cut -d'.' -f1)

    if [ "$major_version" -lt 2 ]; then
        echo "Error: AWS CLI version must be 2.x or higher"
        echo "Current version: $aws_version"
        return 1
    fi

    echo "AWS CLI version $aws_version is compatible"
    return 0
}
```

### 3. AWS Profile Validation Function
```bash
#!/bin/bash

validate_aws_profile() {
    local profile=$1

    # Check if profile exists in credentials file
    if ! grep -q "\[$profile\]" ~/.aws/credentials 2>/dev/null; then
        echo "Error: AWS profile '$profile' not found in credentials file"
        return 1
    fi

    # Check if profile exists in config file
    if ! grep -q "\[profile $profile\]" ~/.aws/config 2>/dev/null; then
        echo "Error: AWS profile '$profile' not found in config file"
        return 1
    fi

    # Validate credentials
    if ! AWS_PROFILE="$profile" aws sts get-caller-identity &>/dev/null; then
        echo "Error: Invalid credentials for profile '$profile'"
        return 1
    fi

    echo "AWS profile '$profile' is valid and authenticated"
    return 0
}
```

### 4. Environment Activation Function
```bash
#!/bin/bash

activate_environment() {
    local environment=$1
    local profile

    case "$environment" in
        "local")
            profile="default"
            ;;
        "testing"|"production")
            profile="$environment"
            ;;
        *)
            echo "Error: Invalid environment"
            return 1
            ;;
    esac

    # Set AWS profile
    export AWS_PROFILE="$profile"

    # Validate the profile
    if ! validate_aws_profile "$profile"; then
        echo "Error: Failed to validate AWS profile for $environment environment"
        return 1
    fi

    echo "Successfully activated $environment environment with profile $profile"
    return 0
}
```

### 5. Main Script with Execution Order Validation
```bash
#!/bin/bash

# Enable error handling
set -euo pipefail

# Function to handle errors
handle_error() {
    echo "Error: $1"
    exit 1
}

# Main execution
main() {
    # 1. Validate arguments
    if ! validate_arguments 1 "$@"; then
        handle_error "Argument validation failed"
    fi

    local environment=$1

    # 2. Check AWS CLI
    if ! check_aws_cli; then
        handle_error "AWS CLI validation failed"
    fi

    # 3. Activate environment
    if ! activate_environment "$environment"; then
        handle_error "Environment activation failed"
    fi

    echo "All checks passed successfully"
    return 0
}

# Execute main function
main "$@"
```

## Testing the Script

### 1. Test Argument Validation
```bash
# Test with no arguments
./script.sh
# Expected: Error about missing arguments

# Test with invalid environment
./script.sh invalid
# Expected: Error about invalid environment
```

### 2. Test AWS CLI Validation
```bash
# Test with AWS CLI uninstalled
# Expected: Error about missing AWS CLI

# Test with outdated AWS CLI
# Expected: Error about version compatibility
```

### 3. Test Profile Validation
```bash
# Test with invalid profile
./script.sh local
# Expected: Error about invalid credentials

# Test with valid profile
./script.sh production
# Expected: Success message
```

## Error Handling Best Practices

1. Use `set -euo pipefail` to enable strict error handling
2. Return meaningful error codes from functions
3. Check return values after function calls
4. Provide clear error messages
5. Implement proper cleanup in case of failures

## Execution Order Validation

The script implements a strict execution order:
1. Argument validation
2. AWS CLI validation
3. Environment activation
4. Profile validation

Each step must succeed before proceeding to the next, ensuring proper setup and configuration.

## Summary

This implementation demonstrates:
- Robust function implementation with proper error handling
- Comprehensive AWS CLI and profile validation
- Clear execution order and dependency management
- Testing capabilities for various scenarios
- Best practices for shell script development

The script provides a solid foundation for AWS environment management while maintaining code quality and reliability.