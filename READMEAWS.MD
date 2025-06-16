# AWS Load Balancer Deployment Guide

This document explains how to deploy your Dockerized Node.js application to AWS EC2 instances and configure an AWS Application Load Balancer (ALB) for high availability and load distribution.

---

## 1. EC2 Instance Setup

- Launch at least **2 EC2 instances** (Amazon Linux 2 or Ubuntu recommended).
- Open ports **80** (HTTP) and **22** (SSH) in the security group.
- Install Docker on each instance:
  ```sh
  # For Amazon Linux 2
  sudo yum update -y
  sudo yum install docker -y
  sudo service docker start
  sudo usermod -aG docker ec2-user
  ```
  *(For Ubuntu, use `apt` instead of `yum` and `ubuntu` as the user.)*

- Pull and run your Docker image on each instance:
  ```sh
  docker run -d -p 80:80 yusuf148/simple-node-app
  ```

---

## 2. Application Load Balancer (ALB) Configuration

- Go to the **EC2 Dashboard > Load Balancers > Create Load Balancer**.
- Choose **Application Load Balancer**.
- Set the listener to **port 80**.
- Create a new target group (instance type) and register your EC2 instances.
- Configure **health checks** (default path `/` is fine for your app).
- Review and create the ALB.

---

## 3. Testing the Setup

- Get the **DNS name** of your ALB from the AWS console.
- Open it in your browser:  
  
- You should see your Node.js app’s response.
- Stop one container and refresh to verify load balancing and health checks.

---

## 4. Deliverables

- **Screenshot:**  
  Include a screenshot of your ALB configuration page (showing listeners, target group, and health checks).

- **EC2 Instance Details:**  
  List instance IDs, public IPs, and Docker run commands used.
   
   
---

## Notes

- Ensure your security groups allow inbound traffic on port 80.
- For production, consider using an ECS cluster or an orchestrator for easier scaling.

---