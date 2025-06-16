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