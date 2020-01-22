FROM node as builder

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .
RUN npm run build

FROM nginx as deployment
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
