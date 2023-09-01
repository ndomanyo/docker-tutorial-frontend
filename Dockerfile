# create the app
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# create the server
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html