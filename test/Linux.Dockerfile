FROM ubuntu:trusty

RUN apt-get update -qq && \
    apt-get install -y \
    ruby ruby-dev && \
    ruby --version

RUN make && make intall
