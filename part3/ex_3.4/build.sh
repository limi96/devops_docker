#! /bin/bash

git clone https://github.com/$1.git ./github_repo
echo $(ls)
cd ./github_repo
docker build . -t github_container

docker login
docker tag github_container $2
docker push $2
