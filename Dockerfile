FROM ubuntu:latest
MAINTAINER RyanTodd
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install make curl git -y && \
    curl -O https://storage.googleapis.com/golang/go1.6.linux-amd64.tar.gz && \
    tar -xvf go1.6.linux-amd64.tar.gz && \
    mv go /root/ && \
    export PATH=$PATH:/usr/local/go/bin && \
    export GOROOT=$HOME/go && \
    export PATH=$PATH:$GOROOT/bin && \
    git clone https://github.com/sammy007/open-ethereum-pool.git && \
    cd open-ethereum-pool && \
    make
CMD ["./build/bin/open-ethereum-pool", "config.json"]
