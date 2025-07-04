# Mini Project: Auto-Scaling with ALB

## Overview

**Purpose:** Learn to configure Auto Scaling in AWS using a Launch Template and integrate it with an Application Load Balancer (ALB).

## Objectives:
- Create a Launch Template with all required specs.
- Set up an Auto Scaling Group using that template.
- Configure Scaling Policies to match traffic demand.
- Attach ALB to the Auto Scaling Group.
- Test Auto Scaling responsiveness by simulating demand.

Project Tasks
**Task 1: Create Launch Template**

- Navigate to EC2 > Launch Templates

- Click Create and fill in AMI, instance type, user data, etc.

**Task 2: Set Up Auto Scaling Group**

- Navigate to EC2 > Auto Scaling Groups

- Click Create, use the launch template

- Configure settings: capacity, network, subnets, scaling rules

**Task 3: Configure Scaling Policies**

- Add policies for scaling in/out based on demand triggers

**Task 4: Attach ALB**

- Go to Load Balancing section and select existing ALB


### Task 1: Create Launch Template
- Sign in to AWS Management Console.

![image](./img/01.png)

- Navigate to the EC2 Dashboard.
- In the left navigation pane, click on "Launch Templates".

![image](./img/02.png)

- Click on "Create launch template".
- Fill in the required details such as name, AMI, instance type, key pair, security groups, and user data.
- Click "Create launch template" to save.

![image](./img/03.png)

![image](./img/04.png)  

!![image](./img/05.png)

!![image](./img/06.png)

### Task 2: Set Up Auto Scaling Group
- In the EC2 Dashboard, click on "Auto Scaling Groups" in the left navigation pane.

![image](./img/07.png)

- Click on "Create Auto Scaling group".

![image](./img/08.png)

- Select the launch template you created in Task 1.

![image](./img/09.png)

- Configure the Auto Scaling group settings:
  - Name your group.
  - Set the VPC and subnets.
  - Define the desired capacity, minimum, and maximum instances.

![image](./img/10.png)

![image](./img/11.png)

![image](./img/12.png)

![image](./img/13.png)

![image](./img/14.png)
