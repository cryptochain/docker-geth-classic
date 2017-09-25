FROM alpine:3.5
MAINTAINER Toby <t.post@hotmail.com>
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
EXPOSE 8545
EXPOSE 30303
ENTRYPOINT ["/geth"]
