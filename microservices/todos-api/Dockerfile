FROM node:20-bullseye-slim AS build
RUN apt-get update && apt-get install -y --no-install-recommends dumb-init
WORKDIR /app
COPY . .
RUN npm ci --only=production

FROM node:20-bullseye-slim
ENV NODE_ENV=production
COPY --from=build /usr/bin/dumb-init /usr/bin/dumb-init
USER node
WORKDIR /app
COPY --chown=node:node --from=build /app/node_modules /app/node_modules
COPY --chown=node:node . /app
CMD ["dumb-init", "node", "server.js"]