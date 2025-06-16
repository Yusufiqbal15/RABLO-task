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