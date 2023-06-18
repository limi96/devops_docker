FROM docker

WORKDIR /usr/src/app

RUN apk update && add bash && apk add git

COPY build.sh .

RUN chmod +x ./build.sh

ENTRYPOINT ["/bin/bash", "/usr/src/app/build.sh"]