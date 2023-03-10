# Base image
FROM node:18

# Create app directory 
WORKDIR /code

# A wildcard is used to ensure both package.json AND package-lock.json are copied
COPY package*.json ./
COPY tsconfig.build.json ./
COPY tsconfig.json ./

# Install app dependencies
RUN npm install

# Bundle app source
COPY ../test /code/test

# Creates a "dist" folder with the production build
RUN npm run build

# Start the server using the production build
CMD [ "start", "main.js" ]