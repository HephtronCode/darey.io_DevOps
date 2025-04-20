# Control Flow in Shell Scripting

Control flow is essential in shell scripting. It allows you to control the execution of commands based on conditions or loops. The following are the main control flow statements in shell scripting:

- **if-else statements**: Used to execute a block of code based on a condition.
- **for loops**: Used to iterate over a list of items or a range of numbers.
- **while loops**: Used to execute a block of code as long as a condition is true.
- **case statements**: Used to execute a block of code based on the value of a variable.

---

## Syntax Overview

### if-else Statement
The `if-else` statement is used to execute a block of code based on a condition. The syntax is as follows:
```bash
if [ condition ]; then
    # code to be executed if condition is true
else
    # code to be executed if condition is false
fi
```

### for Loop
The `for` loop is used to iterate over a list of items or a range of numbers. The syntax is as follows:
```bash
for variable in list; do
    # code to be executed for each item in the list
done
```

---

## Use Cases

### if-else Statement
- **Input Validation**: Check if a user input meets certain criteria.
- **Conditional Execution**: Execute specific commands based on system states or user input.

### for Loop
- **Batch Processing**: Iterate over files in a directory to perform operations like renaming or moving.
- **Automation**: Automate repetitive tasks such as sending emails or generating reports.

---

## Tasks and Examples

### Task 1: Using `if-else` Statements
1. Create a file called `control_flow.sh`:
   ```bash
   vim control_flow.sh
   ```
   ![](./img/01.png)

2. Add the following code:
   ```bash
   #!/bin/bash
   read -p "Enter a number: " num
   ```
   ![](./img/02.png)

3. Save and exit the file by pressing `Esc` and typing `:wq`.
   ![](./img/03.png)

4. Confirm that the file was created:
   ```bash
   ls -latr control_flow.sh
   ```
   ![](./img/04.png)

5. Make the file executable:
   ```bash
   chmod +x control_flow.sh
   ```
   ![](./img/05.png)

6. Run the script:
   ```bash
   ./control_flow.sh
   ```
   ![](./img/06.png)

7. Update the file with the following code:
   ```bash
   #!/bin/bash
   read -p "Enter a number: " num
   echo "You have entered the number $num"
   ```
   ![](./img/07.png)

8. Save and exit the file, then execute the script again:
   ```bash
   ./control_flow.sh
   ```
   ![](./img/08.png)

9. Add conditional logic to check if the number is positive:
   ```bash
   #!/bin/bash
   if [ $num -gt 0 ]; then
       echo "The number is positive."
   fi
   ```
   ![](./img/09.png)

10. Save and exit the file, then run the script:
    ```bash
    ./control_flow.sh
    ```
    ![](./img/10.png)

11. Extend the script to handle negative numbers:
    ```bash
    #!/bin/bash
    read -p "Enter a number: " num
    echo "You have entered the number $num"
    if [ $num -gt 0 ]; then
        echo "The number is positive."
    elif [ $num -lt 0 ]; then
        echo "The number is negative."
    fi
    ```
    ![](./img/11.png)

12. Save and exit the file, then run the script:
    ```bash
    ./control_flow.sh
    ```
    ![](./img/12.png)

---

### Task 2: Using `for` Loops

#### Example 1: Basic for Loop
1. Create a file called `for_loop.sh`:
   ```bash
   vim for_loop.sh
   ```
2. Add the following code:
   ```bash
   #!/bin/bash
   for i in 1 2 3 4 5; do
       echo "Hello, World! This is message $i"
   done
   ```
   ![](./img/13.png)

3. Save and exit the file, then confirm it was created:
   ```bash
   ls -latr for_loop.sh
   ```
   ![](./img/14.png)

4. Make the file executable:
   ```bash
   chmod +x for_loop.sh
   ```
   ![](./img/15.png)

5. Run the script:
   ```bash
   ./for_loop.sh
   ```
   ![](./img/16.png)

#### Example 2: Alternative Syntax
1. Create a file called `for_loop_alternative.sh`:
   ```bash
   vim for_loop_alternative.sh
   ```
   ![](./img/17.png)

2. Add the following code:
   ```bash
   #!/bin/bash
   for i in {1..5}; do
       echo "Counting... $i"
   done
   ```
   ![](./img/18.png)

3. Save and exit the file, then confirm it was created:
   ```bash
   ls -latr for_loop_alternative.sh
   ```
   ![](./img/19.png)

4. Make the file executable:
   ```bash
   chmod +x for_loop_alternative.sh
   ```
   ![](./img/20.png)

5. Run the script:
   ```bash
   ./for_loop_alternative.sh
   ```
   ![](./img/21.png)

#### Example 3: C-Style for Loop
1. Create a file called `for_loop_c_style.sh`:
   ```bash
   vim for_loop_c_style.sh
   ```
   ![](./img/22.png)

2. Add the following code:
   ```bash
   #!/bin/bash
   for (( i=1; i<=5; i++ )); do
       echo "Number $i"
   done
   ```
   ![](./img/23.png)

3. Save and exit the file, then confirm it was created:
   ```bash
   ls -latr for_loop_c_style.sh
   ```
   ![](./img/24.png)

4. Make the file executable:
   ```bash
   chmod +x for_loop_c_style.sh
   ```
   ![](./img/25.png)

5. Run the script:
   ```bash
   ./for_loop_c_style.sh
   ```
   ![](./img/26.png)

---

## Best Practices

1. **Use Comments**: Add comments to explain the purpose of your code, especially for complex logic.
2. **Validate Input**: Always validate user input to avoid unexpected behavior or errors.
3. **Use Meaningful Variable Names**: Use descriptive variable names to make your code more readable.
4. **Test Scripts**: Test your scripts in a safe environment before deploying them to production.
5. **Error Handling**: Include error handling to manage unexpected scenarios gracefully.
6. **Use ShellCheck**: Use tools like `ShellCheck` to lint your shell scripts and catch potential issues.

---

By following these examples and best practices, you can effectively use control flow statements in shell scripting to automate tasks and handle complex logic.



