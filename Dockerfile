FROM node:14-alpine

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and install dependencies
COPY package.json ./
RUN npm install --only=production

# Copy the application source code
COPY src/ .

# Expose port 80
EXPOSE 80

# Command to run the application
CMD ["node", "index.js"]