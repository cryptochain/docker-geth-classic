FROM alpine:3.5

LABEL maintainer="Dmitry Ananichev <a@qozz.ru>"

RUN apk add --no-cache --virtual --update go \
        git \
        gcc \
        musl-dev
ENV GOPATH=/
RUN  \
    go get github.com/ethereumproject/go-ethereum/cmd/geth && \
    git clone https://github.com/ethereumproject/go-ethereum && \
    cd ./go-ethereum && \
    go install -ldflags "-X main.Version="`git describe --tags` github.com/ethereumproject/go-ethereum/cmd/geth && \
    cd .. && \
    rm -rf ./go-ethereum && \
    rm -rf ./pkg  && \
    rm -rf ./src  && \
    cp `which geth` /

RUN mkdir /root/files
RUN mkdir /root/.ethereum
RUN mkdir /root/.ethereum/devchain

VOLUME ./files/genesis.json:/root/files/genesis.json:ro
VOLUME ./files/keystore:/root/.ethereum/devchain/keystore:rw

EXPOSE 8545
EXPOSE 30303
ENTRYPOINT ["/geth"]
