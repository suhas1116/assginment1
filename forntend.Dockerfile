# Use a base image appropriate for your frontend application
FROM node:14

# Set the working directory inside the container
WORKDIR /app/frontend

# Copy package.json and package-lock.json
COPY frontend/package.json ./

# Install dependencies
RUN npm install
RUN npm run test

# Copy the rest of the application files
COPY frontend/ .

# Build the frontend application
RUN npm run build

# Expose the port on which the frontend runs
EXPOSE 8080

# Start a simple web server to serve the built frontend files
CMD ["npx", "http-server", "dist", "index.js"]