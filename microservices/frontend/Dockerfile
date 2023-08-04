FROM node:14-bullseye-slim AS build
RUN apt-get update && apt-get install -y --no-install-recommends dumb-init
WORKDIR /app
COPY . .
RUN npm ci
RUN npm run build

FROM node:14-bullseye-slim
COPY --from=build /usr/bin/dumb-init /usr/bin/dumb-init
USER node
WORKDIR /app
COPY --chown=node:node --from=build /app/node_modules /app/node_modules
COPY --chown=node:node . /app
CMD ["dumb-init", "npm", "start"]
