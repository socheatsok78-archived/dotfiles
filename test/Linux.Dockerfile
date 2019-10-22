FROM ubuntu:trusty

RUN apt-get update -qq && \
    apt-get install -y \
    ruby2.4 ruby2.4-dev

RUN make && make intall
