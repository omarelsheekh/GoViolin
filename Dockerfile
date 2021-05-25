FROM golang

WORKDIR /code
COPY . /code/

RUN go mod init
RUN go mod tidy
RUN go mod vendor
RUN go build .

CMD /code/GoViolin