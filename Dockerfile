FROM node:16 as development

# Create app directory, this is in our container/in our image
WORKDIR /thomas/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# RUN npm ci --only=production

# Bundle app source
COPY . .

RUN npm run build

CMD [ "node", "dist/main" ]