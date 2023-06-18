#General 

At the end are the results of running 
```
docker image history [image]
```

#Frontend comparison

The result did not change significantly, as both images are still 352 MB size for the run portion of the dockerfile. 

I could not chain all run commands under a single layer, as I also cloned the repository before other run commands and had to change the WORKDIR. 

#Backend comparison 

Just like the frontend, chaining all run commands did not significantly affect the layer size for the run command; both are still 146 MB in size. 

As with the frontend, the repo cloning from github could not be put under a single run command. 

## Frontend Before

```
b2387c94da44   21 seconds ago   CMD ["serve" "-s" "-l" "5000" "build"]          0B        buildkit.dockerfile.v0
<missing>      21 seconds ago   USER appuser                                    0B        buildkit.dockerfile.v0
<missing>      21 seconds ago   RUN /bin/sh -c chown appuser . # buildkit       0B        buildkit.dockerfile.v0
<missing>      22 seconds ago   RUN /bin/sh -c useradd -m appuser # buildkit    334kB     buildkit.dockerfile.v0
<missing>      23 seconds ago   RUN /bin/sh -c npm install -g serve # buildk…   6.38MB    buildkit.dockerfile.v0
<missing>      28 seconds ago   RUN /bin/sh -c npm run build # buildkit         8.71MB    buildkit.dockerfile.v0
<missing>      54 seconds ago   RUN /bin/sh -c npm install # buildkit           337MB     buildkit.dockerfile.v0
<missing>      3 minutes ago    COPY . . # buildkit                             688B      buildkit.dockerfile.v0
<missing>      3 minutes ago    WORKDIR /usr/src/app/material-applications/e…   0B        buildkit.dockerfile.v0
<missing>      3 minutes ago    COPY . . # buildkit                             688B      buildkit.dockerfile.v0
```

## Frontend After

```
IMAGE          CREATED          CREATED BY                                      SIZE      COMMENT
56e394afe00a   20 seconds ago   CMD ["serve" "-s" "-l" "5000" "build"]          0B        buildkit.dockerfile.v0
<missing>      20 seconds ago   USER appuser                                    0B        buildkit.dockerfile.v0
<missing>      20 seconds ago   RUN /bin/sh -c npm install && npm run build …   352MB     buildkit.dockerfile.v0
<missing>      3 minutes ago    COPY . . # buildkit                             647B      buildkit.dockerfile.v0
<missing>      3 minutes ago    WORKDIR /usr/src/app/material-applications/e…   0B        buildkit.dockerfile.v0
<missing>      3 minutes ago    RUN /bin/sh -c git clone https://github.com/…   2.93MB    buildkit.dockerfile.v0
<missing>      3 minutes ago    COPY . . # buildkit                             647B      buildkit.dockerfile.v0
```

## Backend before

633ea7a9e249   2 minutes ago    CMD ["./server"]                                0B        buildkit.dockerfile.v0
<missing>      2 minutes ago    EXPOSE map[8080/tcp:{}]                         0B        buildkit.dockerfile.v0
<missing>      2 minutes ago    RUN /bin/sh -c go build # buildkit              146MB     buildkit.dockerfile.v0
<missing>      2 minutes ago    WORKDIR /usr/src/app/material-applications/e…   0B        buildkit.dockerfile.v0
<missing>      2 minutes ago    RUN /bin/sh -c chown appuser /usr/src/app/ma…   0B        buildkit.dockerfile.v0
<missing>      2 minutes ago    COPY . . # buildkit                             688B      buildkit.do

## Backend after

IMAGE          CREATED          CREATED BY                                      SIZE      COMMENT
f4486867acb9   18 minutes ago   CMD ["./server"]                                0B        buildkit.dockerfile.v0
<missing>      18 minutes ago   EXPOSE map[8080/tcp:{}]                         0B        buildkit.dockerfile.v0
<missing>      18 minutes ago   RUN /bin/sh -c go build # buildkit              146MB     buildkit.dockerfile.v0
<missing>      20 minutes ago   WORKDIR /usr/src/app/material-applications/e…   0B        buildkit.dockerfile.v0
<missing>      20 minutes ago   RUN /bin/sh -c chown appuser /usr/src/app/ma…   0B        buildkit.dockerfile.v0
<missing>      20 minutes ago   COPY . . # buildkit                             943B      buildkit.dockerfile.v0







