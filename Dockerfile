FROM golang:latest

RUN go get -d github.com/lightningnetwork/lnd/releases/download/v0.12.1-beta.rc5/lnd-linux-amd64-v0.12.1-beta.rc5.tar.gz
RUN go get -d github.com/LN-Zap/lndconnect && cd $GOPATH/src/github.com/LN-Zap/lndconnect && make
WORKDIR $GOPATH/src/github.com/lightningnetwork/lnd
RUN make && make install

ENTRYPOINT lnd
