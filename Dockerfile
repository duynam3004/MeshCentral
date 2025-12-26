# Use the official Node.js image
FROM node:18-alpine

# Set the working directory
WORKDIR /app

# Copy the source code into the container
COPY . .

# IMPORTANT: Copy your custom configuration into the correct folder
COPY meshcentral-data/config.json ./meshcentral-data/config.json

# Install dependencies
RUN npm install --omit=dev

# Expose the port MeshCentral will listen on
EXPOSE 8080

# The final, simple start command
CMD [ "node", "meshcentral.js", "--port", "8080" ]
