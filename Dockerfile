FROM golang:latest

RUN go get -d github.com/lightningnetwork/lnd@v0.12.1-beta.rc5
RUN go get -d github.com/LN-Zap/lndconnect && cd $GOPATH/src/github.com/LN-Zap/lndconnect && make
WORKDIR $GOPATH/src/github.com/lightningnetwork/lnd
RUN make && make install

ENTRYPOINT lnd
