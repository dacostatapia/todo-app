FROM golang:alpine3.17 AS build
ENV GOPATH /go
WORKDIR $GOPATH/src/app
COPY . .
ENV GO111MODULE=on
RUN go mod init && go get github.com/davecgh/go-spew/spew && go mod tidy
RUN go build -o /auth-api

FROM scratch
WORKDIR /
COPY --from=build /auth-api /auth-api
CMD ["./auth-api"]