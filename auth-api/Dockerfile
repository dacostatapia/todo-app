FROM golang:alpine3.17
ENV GOPATH /go
WORKDIR $GOPATH/src/app
COPY . .
ENV GO111MODULE=on
RUN go mod init && go get github.com/davecgh/go-spew/spew && go mod tidy
RUN go build
CMD ["./app"]