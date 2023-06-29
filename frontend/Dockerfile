FROM node:14.9.0-alpine
WORKDIR /app
COPY . .
RUN rm package-lock.json && npm install
RUN npm run build
CMD ["npm", "start"]
