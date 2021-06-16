# Create image based on the official Node 14.5 image from dockerhub
FROM node:14.15

# Create a directory where our app will be placed
RUN mkdir -p /app

# Change directory so that our commands run inside this new directory
WORKDIR /app

# Copy dependency definitions
COPY package*.json /app/

# Install dependecies
RUN npm install
RUN npm install -g @angular/cli

# Get all the code needed to run the app
COPY . /app/
# RUN node_modules/.bin/ng build 

# Expose the port the app runs in
EXPOSE 4200

# Serve the app
CMD ng serve --host 0.0.0.0