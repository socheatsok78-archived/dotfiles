FROM ubuntu:trusty

RUN apt-get update -qq && \
    apt-get install -y \
    software-properties-common \
    build-essential

RUN apt-add-repository -y ppa:rael-gc/rvm && \
    apt-get update -qq && \
    apt-get install -y \
    rvm

RUN rvm install ruby

RUN ruby --version

RUN make && make intall
