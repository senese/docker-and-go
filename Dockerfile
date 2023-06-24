FROM golang:1.15-alpine as builder

RUN mkdir -p /app
WORKDIR /app
COPY . .

ENV CGO_ENABLED=0
RUN GOOS=linux go build ./main.go

FROM scratch

WORKDIR /app
COPY --from=builder /app/main .

CMD ["/app/main"]