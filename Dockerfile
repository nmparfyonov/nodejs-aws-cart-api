FROM node:18-alpine AS build
WORKDIR /app
COPY package*.json .
RUN npm i
COPY . .
RUN npm run build

FROM node:18-alpine
USER node
COPY --chown=node:node --from=build /app/dist ./dist
COPY --chown=node:node --from=build /app/node_modules ./node_modules
CMD [ "node", "dist/main.js" ]