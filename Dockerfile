# create the app
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# create the server
FROM nginx
# port to serve from
EXPOSE 80           
COPY --from=builder /app/build /usr/share/nginx/html