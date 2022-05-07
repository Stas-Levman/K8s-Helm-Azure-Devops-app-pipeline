FROM node:14.19.1-alpine

WORKDIR /bootcamp-app

COPY . .

RUN npm install

EXPOSE 8080

ENTRYPOINT [ "node", "src/index.js"]

