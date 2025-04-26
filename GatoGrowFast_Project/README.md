# Project for GatoGrowFast.com 

## Description
A growth marketing consultancy company called GatoGrowFast.com wants to give some access to their employee Eric, Jack and Ade to the Aws resources. This project would cover the use of AWS IAM to create a user and assign them the necessary permissions to access the resources.

## Prerequisites
- AWS account
- AWS console access

## Part 1: Create an IAM policy
1. Go to the IAM console in AWS.

![image](./img/01.png)

2. Click on "Policies" in the left sidebar.

![image](./img/02.png)

3. Search EC2 and select the "AmazonEC2FullAccess" policy and then click on "Create policy".    

![image](./img/03.png)

4. Select "all actions" and "all resources" and click on "Next: Tags".

![image](./img/04.png)

![image](./img/05.png)

5. Click on "Next: Review".
6. Name the policy 'Policy_for _Eric' and add a description.

![image](./img/06.png)

7. Click on "Create policy".

![image](./img/07.png)

8. Policy created successfully.

![image](./img/08.png)

9. Now proceed to create a user.
10. Click on "Users" in the left sidebar.
11. Click on "Create user".

![image](./img/09.png)

12. Enter the username 'Eric' and select "Provide user access to AWS console".
13. Select "Generate password" and "Require password reset".

![image](./img/10.png)

14. Click on "Next: Permissions".
15. Select "Attach existing policies directly".
16. Search for the policy you created earlier and select it.

![image](./img/11.png)

17. Review the permissions and click on "Create user".

![image](./img/12.png)

18. User created successfully.

19. Download the credentials and save them in a secure location.

![image](./img/13.png)

![image](./img/14.png)

## Part 2: Create a group and assign permissions
1. Go to the IAM console in AWS.
2. Click on "Groups" in the left sidebar.

![image](./img/15.png)

3. Click on "Create group".

![image](./img/16.png)

4. Enter the group name "Development-Team" and click on "Create group".

![image](./img/17.png)

![image](./img/18.png)

### Now let's create two new users 'Jack' and 'Ade' and assign them to the group.
1. Click on "Users" in the left sidebar.
2. Click on "Create user".
3. Enter the username 'Jack' and select "Provide user access to AWS console".
4. Select "Generate password" and "Require password reset".
5. Click on "Next: Permissions".

![image](./img/19.png)

6. Select "Add user to group".
7. Select the group "Development-Team". 

![image](./img/20.png)

8. Click on "Next" and review the permissions.
9. Click on "Create user".

![image](./img/21.png)

10. Download the credentials and save them in a secure location.

![image](./img/22.png)

12. Now repeat the same steps to create a user 'Ade' and assign them to the group "Development-Team".
13. Click on "Users" in the left sidebar.
14. Click on "Create user".
15. Enter the username 'Ade' and select "Provide user access to AWS console".
16. Select "Generate password" and "Require password reset".
17. Click on "Next: Permissions".
18. Select "Add user to group".
19. Select the group "Development-Team".
20. Click on "Next" and review the permissions.
21. Click on "Create user".
22. Download the credentials and save them in a secure location.

![image](./img/23.png)

![image](./img/24.png)

![image](./img/25.png)

On the IAM console, you can see the users and the group created.

![image](./img/26.png)

23. Navigate to IAM policy and creata a new policy.
24. Click on "Policies" in the left sidebar.
25. Click on "Create policy".

![image](./img/27.png)

26. Choose "EC2" and "S3" services and select "all actions" and "all resources".

![image](./img/28.png)

![image](./img/29.png)

![image](./img/30.png)

![image](./img/31.png)

27. Click on "Next: Tags".
28. Click on "Next: Review".
29. Name the policy 'development-team-policy' and add a description.

![image](./img/32.png)

30. Click on "Create policy".
31. Policy created successfully.

32. Navigate to users group "Development-Team".
33. Click on "Groups" in the left sidebar.

![image](./img/33.png)

34. Click on "Development-Team".
35. Click on "Permissions" tab.

![image](./img/34.png)

36. Click on "Attach policies".
37. Filter type by "Customer managed".
38. Search for the policy you created earlier and select it.
39. Click on "Attach policy".

![image](./img/35.png)

40. Policy attached successfully.
41. Now you can see the policy attached to the group.

![image](./img/36.png)

***Now you can login to the AWS console using the credentials of the users you created and access the resources.***

## Conclusion
This project covered the use of AWS IAM to create users, groups, and policies to manage access to AWS resources. You can now assign permissions to users and groups based on their roles and responsibilities. This is a crucial step in ensuring the security and management of your AWS resources.