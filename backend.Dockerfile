# Use a base image appropriate for your backend application
FROM node:14

# Set the working directory inside the container
WORKDIR /app/backend

# Copy package.json and package-lock.json
COPY backend/package-lock.json ./

# Install dependencies
RUN npm install
RUN npm run test

# Copy the rest of the application files
COPY backend/ .

# Expose the port on which the backend runs
EXPOSE 3000

# Start the backend application
CMD ["npm", "start"]