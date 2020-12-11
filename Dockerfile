FROM arm32v7/golang:latest

RUN go get -d github.com/lightningnetwork/lnd
RUN go get -d github.com/LN-Zap/lndconnect && cd $GOPATH/src/github.com/LN-Zap/lndconnect && make
WORKDIR $GOPATH/src/github.com/lightningnetwork/lnd
RUN make && make install

ENTRYPOINT lnd