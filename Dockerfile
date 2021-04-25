FROM golang:1.15 AS builder

WORKDIR /go/src/app

COPY ./app .

RUN go build -ldflags '-s -w' hello.go

FROM scratch

WORKDIR /app

COPY --from=builder /go/src/app /

CMD ["/hello"]