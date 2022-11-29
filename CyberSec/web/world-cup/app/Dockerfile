FROM node:alpine

RUN apk --no-cache add supervisor g++ make python3

RUN mkdir -p /app

WORKDIR /app
COPY challenge .

RUN yarn install

EXPOSE 5000

COPY config/supervisord.conf /etc/supervisord.conf

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
