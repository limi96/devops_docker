FROM openjdk:8

WORKDIR /usr/src/app

RUN git clone https://github.com/docker-hy/material-applications

EXPOSE 8080

COPY . .

#CMD ["cd", "material-applications/spring-example-project"]
#RUN ./material-applications/spring-example-project/mvnw package
#RUN cd spring-example-project
#RUN cd material-applications/spring-example-project
WORKDIR material-applications/spring-example-project
RUN ./mvnw package
CMD ["java", "-jar",  "./target/docker-example-1.1.3.jar"]

