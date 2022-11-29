FROM python:3.10-alpine

RUN apk update && \
    apk add socat 

COPY challenge /challenge/

WORKDIR /challenge

RUN chmod +x entrypoint.sh
    
ENTRYPOINT ["./entrypoint.sh"]
