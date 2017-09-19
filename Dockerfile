FROM node:6.9.5-alpine

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY package.json /usr/src/app
COPY yarn.lock /usr/src/app

# Install app dependencies
# COPY package.json /usr/src/app/
RUN npm install -g -s --no-progress yarn && \
    yarn install

# Bundle app source
COPY . /usr/src/app

# Expose the public http port
EXPOSE 9000

# build and Start server
CMD ["yarn", "server"]
