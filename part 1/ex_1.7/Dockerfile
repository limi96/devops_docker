FROM ubuntu:20.04

WORKDIR /usr/src/app

COPY missing.sh .

RUN chmod +x missing.sh
RUN apt-get update
RUN apt-get -y install curl

# When running Docker run the command will be ./hello.sh
CMD ./missing.sh

