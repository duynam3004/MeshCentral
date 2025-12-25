# Use an official Node.js runtime as a parent image
FROM node:18-alpine

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install the application dependencies
RUN npm install --omit=dev

# Copy the rest of the application source code
COPY . .

# Tell Railway that the container will listen on this port
EXPOSE 8080

# The command to run the application
# We use --no-tls because Railway provides the public HTTPS certificate
CMD ["node", "meshcentral.js", "--port", "8080", "--no-tls"]
