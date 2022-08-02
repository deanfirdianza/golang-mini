# syntax=docker/dockerfile:1

FROM golang:1.18-alpine AS builder

WORKDIR /app

COPY . .
RUN go mod download
RUN go build -o /golang-mini

FROM alpine
COPY --from=builder /golang-mini ./
RUN chmod +x ./golang-mini

ENTRYPOINT [ "./golang-mini" ]

EXPOSE 8080
