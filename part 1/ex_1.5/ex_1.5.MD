# Image size
Ubuntu is at 83 MB
Alpine is at 15.7 MB



# Commands used:

```
docker pull devopsdockeruh/simple-web-service:alpine

docker run -d -it --name message devopsdockeruh/simple-web-service:alpine

docker logs -f message

docker exec -it message sh

tail -f ./text.log
```
