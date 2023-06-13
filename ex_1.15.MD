Downloaded the source file from
https://github.com/docker-hy/material-applications/tree/main/spring-example-project 

Project available here on Docker Hub: https://hub.docker.com/r/limi96/ex_1.15

To run the image use

docker pull limi96/ex_1.15
docker run limi96/ex_1.15


Steps to publishing the project on to Docker Hub.

Created a dockerfile 

Commands used to build the image

docker build . -t ex_1.15
docker tag docker_hub_exercise limi96/ex_1.15
docker push limi96/ex_1.15


The Dockerfile:

FROM openjdk:8

WORKDIR /usr/src/app

RUN git clone https://github.com/docker-hy/material-applications

EXPOSE 8080

COPY . .

WORKDIR material-applications/spring-example-project
RUN ./mvnw package
CMD ["java", "-jar",  "./target/docker-example-1.1.3.jar"]
