# Commands used:

## Front end:
```
docker build . -t frontend
docker run -p 5000:5000 frontend
```
## Backend:
```
docker build . -t backend
docker run -p 8080:8080 backend
```
# Dockerfiles

## Frontend:

```
FROM node:16

WORKDIR /usr/src/app

RUN git clone https://github.com/docker-hy/material-applications

EXPOSE 5000
ENV REACT_APP_BACKEND_URL=http://127.0.0.1:8080
COPY . .

WORKDIR material-applications/example-frontend/
COPY . .

# EXPOSE 5000
# ENV REACT_APP_BACKEND_URL=http://127.0.0.1:8080

RUN npm install
RUN npm run build
RUN npm install -g serve
CMD ["serve", "-s", "-l", "5000", "build"]
```

## Backend:

```
FROM golang:1.16

WORKDIR /usr/src/app

EXPOSE 8080
ENV REQUEST_ORIGIN=http://127.0.0.1:5000

RUN git clone https://github.com/docker-hy/material-applications
WORKDIR material-applications/example-backend

COPY . .

# EXPOSE 8080
# ENV REQUEST_ORIGIN=http://127.0.0.1:5000

RUN go build

CMD ["./server"]
```
