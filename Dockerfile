# Use the official Node.js image
FROM node:latest

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies including test dependencies
RUN npm install

# Copy the application files
COPY . .

# Expose the application's port
EXPOSE 4200

# Run the tests and Install test dependencies
RUN npm install --save-dev jest supertest 

# Add test scripts (this assumes your test files are in a __tests__ folder)
RUN npm test

# Start the application
CMD ["node", "app.js"]
