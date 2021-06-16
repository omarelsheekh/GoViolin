FROM golang AS builder

WORKDIR /code
COPY . /code/

RUN go mod init
RUN go mod tidy
RUN go mod vendor
RUN go build .

FROM ubuntu AS app
WORKDIR /app

COPY --from=builder /code/GoViolin /app/GoViolin
COPY --from=builder /code/css /app/css
COPY --from=builder /code/img /app/img
COPY --from=builder /code/mp3 /app/mp3
COPY --from=builder /code/templates /app/templates

CMD ["./GoViolin"]
