# Comments in Shell Scripting
Comments are essential parts of shell scripting. They help us document or take note relating to the script one is writing. Just like in programming, comments can also be you to tell the shell not to read a particular part of the script by commenting out the targeted script. 

## Types of Comments in Shell Scripting
There are two types of comments in shell scripting: single-line comments and multi-line comments.

### Single-line Comments
Single-line comments are used to comment out a single line of code. They are denoted by a single '#' sign followed by the comment.

- Example
```bash
# This is a single-line comment in Bash
echo "Hello, you are learning Bash Scripting on DAREY.IO!" # This is also a comment, following a command
```
![Single-line comment](./img/01.png)

In the above example, the first line is a single-line comment, and the second line is also a single-line

#### Use Cases for Single-line Comments
1. **Function Documentation**
   ```bash
   # Calculates the sum of two numbers
   sum() {
       echo $(($1 + $2))
   }
   ```

2. **Variable Description**
   ```bash
   # Maximum number of retry attempts for the backup process
   MAX_RETRIES=3
   ```

3. **Command Explanation**
   ```bash
   # Kill process with PID 1234 if it exists
   kill -9 1234 2>/dev/null || echo "Process not found"
   ```

### Multiple-single-line Comments
Multiple single-line comments are used to comment out multiple lines of code. They are denoted by a '#' sign followed by the comment on each line.
- Example
```bash
# This is another way to create
# a multi-line comment. Each line
# is prefixed with a # symbol.
echo "Here is an actual code that gets executed"
```
![Multiple-single-line](./img/02.png)

#### Use Cases for Multiple-single-line Comments
1. **Script Header Documentation**
   ```bash
   #!/bin/bash
   # Script Name: backup_database.sh
   # Description: Creates a backup of the MySQL database
   # Author: John Doe
   # Date: 2024-03-20
   # Version: 1.0
   ```

2. **Complex Function Documentation**
   ```bash
   # Function: process_logs
   # Purpose: Analyzes log files for error patterns
   # Parameters:
   #   $1 - Log file path
   #   $2 - Error threshold (optional)
   # Returns: 0 on success, 1 on failure
   process_logs() {
       # Function implementation
   }
   ```

3. **Configuration Block Documentation**
   ```bash
   # Database Configuration
   # ---------------------
   # HOST: Database server hostname
   # PORT: Database server port
   # USER: Database username
   # PASS: Database password
   DB_HOST="localhost"
   DB_PORT="3306"
   DB_USER="admin"
   DB_PASS="secret"
   ```

## Best Practices for Using Comments

1. **Be Clear and Concise**
   - Write comments that explain the "why" rather than the "what"
   - Keep comments up-to-date with code changes
   - Use proper grammar and spelling

2. **Comment Structure**
   - Start scripts with a header comment block
   - Document all functions with their purpose and parameters
   - Use consistent comment formatting throughout the script

3. **Avoid Common Pitfalls**
   - Don't comment out code without explaining why
   - Avoid redundant comments that just repeat the code
   - Don't leave TODO comments without tracking them

4. **Documentation Standards**
   ```bash
   #!/bin/bash
   #
   # Script: example.sh
   # Purpose: Demonstrates proper comment usage
   # Author: Your Name
   # Date: YYYY-MM-DD
   #
   # Usage: ./example.sh [OPTIONS]
   # Options:
   #   -h    Display help message
   #   -v    Enable verbose output
   #
   # Dependencies:
   #   - awk
   #   - sed
   #
   # Exit Codes:
   #   0 - Success
   #   1 - Invalid arguments
   #   2 - Missing dependencies
   ```

5. **Maintenance Tips**
   - Review and update comments when modifying code
   - Remove obsolete comments
   - Use version control commit messages to track major changes
   - Consider using a documentation generator for large projects