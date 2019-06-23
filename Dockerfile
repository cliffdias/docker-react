#Configuration stage
FROM node:alpine as builder

WORKDIR '/app'

COPY ./package.json .

RUN npm install

COPY . .

CMD ["npm", "run", "build"]

#configuration for run phase
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

