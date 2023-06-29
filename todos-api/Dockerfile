FROM node:20-alpine3.17
WORKDIR /app
COPY . .
RUN npm install && npm prune --production
CMD ["node", "server.js"]