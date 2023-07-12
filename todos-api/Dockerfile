# BUILD IMAGE (Multi-stage build)
FROM node:20-bullseye-slim AS build
# Fix possible vulnerabilities
RUN apt-get update && apt-get install -y --no-install-recommends dumb-init
WORKDIR /app
COPY . .
# Only production deterministic installation
RUN npm ci --only=production

# PRODUCTION IMAGE (Multi-stage build)
# Best overall Node image
FROM node:20-bullseye-slim
# Optimize tooling for production
ENV NODE_ENV=production
COPY --from=build /usr/bin/dumb-init /usr/bin/dumb-init
# Use user with less privileges for security
USER node
WORKDIR /app
# To avoid modified copies of node_modules
COPY --chown=node:node --from=build /app/node_modules /app/node_modules
COPY --chown=node:node . /app
# Allow a more graceful shutdown
CMD ["dumb-init", "node", "server.js"]