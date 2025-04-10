FROM golang:1.22-alpine AS builder
WORKDIR /app
COPY . .
RUN go build -o http-echo

FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/http-echo .

EXPOSE 5678
ENV ECHO_TEXT="hello-world"

ENTRYPOINT ["/app/http-echo"]
