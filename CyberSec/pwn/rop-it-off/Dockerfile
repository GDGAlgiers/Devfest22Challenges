FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y socat && \
    rm -rf /var/lib/apt/lists/*

RUN useradd ctf && \
    mkdir /challenge

COPY challenge /challenge

WORKDIR /challenge

RUN chmod +x entrypoint.sh rop-it-off && \
    chown -R root:root .

USER ctf

EXPOSE 1337

ENTRYPOINT ["./entrypoint.sh"]
