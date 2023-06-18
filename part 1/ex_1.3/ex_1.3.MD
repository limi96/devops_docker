# Answer
Secret message is: 'You can find the source code here: https://github.com/docker-hy'

# Commands used

```
docker run -d -it --name message devopsdockeruh/simple-web-service:ubuntu

docker logs -f message

docker exec -it message bash

tail -f ./text.log
```
