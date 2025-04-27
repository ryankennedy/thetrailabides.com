FROM node:latest AS builder

COPY . /tmp/thetrailabides.com
RUN cd /tmp/thetrailabides.com && npm run build

FROM nginx:alpine

COPY --from=builder /tmp/thetrailabides.com/_site /usr/share/nginx/html
