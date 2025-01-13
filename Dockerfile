# syntax=docker/dockerfile:1

FROM node:lts-alpine
WORKDIR /app
RUN rm -rf /var/lib/apt/lists/*
COPY yarn.lock package.json ./
RUN yarn install
COPY . .
RUN yarn install && yarn build
CMD ["node", "dist/main.js"]
EXPOSE 3000