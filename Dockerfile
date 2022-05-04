FROM node:14.19.1-alpine

WORKDIR /bootcamp-app

COPY . .

RUN npm install

RUN apk add gettext

EXPOSE 8080

ENTRYPOINT [ "node", "src/index.js"]

