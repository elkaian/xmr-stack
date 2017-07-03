FROM alpine:3.6

RUN apk update && \
    apk add --no-cache git make cmake g++ openssl-dev libmicrohttpd-dev

RUN git clone https://github.com/fabionitto/xmr-stak-cpu.git
RUN cd xmr-stak-cpu && \
    cmake . && \
    make install

WORKDIR /xmr-stak-cpu/bin

CMD ["/xmr-stak-cpu/bin/xmr-stak-cpu"]
