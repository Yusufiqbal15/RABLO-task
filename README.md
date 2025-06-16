# Simple Node.js Web Application

This project is a simple Node.js web application that demonstrates how to create a Docker container for a Node.js app. The application has a single endpoint that responds with a message.

## Project Structure

```
simple-node-app
├── src
│   └── index.js
├── Dockerfile
├── package.json
└── README.md
```

## Getting Started

### Prerequisites

- Docker installed on your machine
- Node.js and npm (for local development)

### Building the Docker Image

1. Navigate to the project directory:

   ```
   cd simple-node-app
   ```

2. Build the Docker image:

   ```
   docker build -t yusuf148/simple-node-app .
   ```

### Running the Docker Container

To run the Docker container, use the following command:

```
docker run -p 80:80 yusuf148/simple-node-app
```

You can now access the application by navigating to `http://localhost:80` in your web browser.

### Pushing the Docker Image to Docker Hub

1. Log in to Docker Hub:

   ```
   docker login
   ```

2. Push the image to Docker Hub:

   ```
   docker push yusuf148/simple-node-app
   ```
## License

This project is licensed under the MIT License.
---------------------------------------------------------------------------------------------------------------------------------------
2.

# NGINX Reverse Proxy Setup for Simple Node.js App

This guide explains how to set up NGINX as a reverse proxy with load balancing and static file serving for your Dockerized Node.js application using Docker Compose.

## Project Structure

```
simple-node-app
├── src
│   └── index.js
├── Dockerfile
├── package.json
├── docker-compose.yml
├── nginx
│   └── nginx.conf
├── static
│   └── (your static files)
└── README.md
```

## How It Works

- **NGINX** listens on port 80 and forwards API requests to two Node.js app containers (`node-app1` and `node-app2`) for basic load balancing.
- Requests to `/static/` are served directly from the `static` folder.

## Running NGINX and Node.js Containers Together

1. **Navigate to the project directory:**
   ```
   cd simple-node-app
   ```

2. **Start all services using Docker Compose:**
   ```
   docker compose up --build
   ```

3. **Access your application:**
   - API endpoint: [http://localhost/](http://localhost/)
   - Static files: [http://localhost/static/yourfile](http://localhost/static/yourfile)

## NGINX Configuration

- The `nginx.conf` file is located in the `nginx` folder.
- It defines an upstream group for load balancing and serves static files from `/static`.

## Stopping the Services

To stop all running containers:
```
docker compose down
```

---

**Note:**  
Make sure Docker Desktop is running before starting the containers.

---

-------------------------------------------------------------------------------------------------------
3.
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