# Commands used: 

```
docker build . -t back
docker run -p 8080:8080 back

```

# Dockerfile used: 

```
FROM golang:1.16

WORKDIR /usr/src/app

# EXPOSE 8080
# ENV REQUEST_ORIGIN=http://127.0.0.1:5000

RUN git clone https://github.com/docker-hy/material-applications
WORKDIR material-applications/example-backend

COPY . .

EXPOSE 8080
ENV REQUEST_ORIGIN=http://127.0.0.1:5000

RUN go build

CMD ["./server"]
```

