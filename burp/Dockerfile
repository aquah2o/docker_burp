#FROM ubuntu:16.04
#FROM adoptopenjdk/openjdk11:latest
#FROM adoptopenjdk:11-jre-hotspot
#FROM debian:stretch
FROM ubuntu:latest
#RUN apt-get install software-properties-common
#RUN add-apt-repository ppa:openjdk-r/ppa

RUN sed 's/main$/main universe/' -i /etc/apt/sources.list 
RUN apt-get update

RUN apt-get install -y software-properties-common
#RUN add-apt-repository ppa:openjdk-r/ppa
#RUN apt-get install -y openjdk-8-jdk-headless

RUN apt-get update && apt-get install -y wget ca-certificates software-properties-common && \
    apt-get update && apt-get install -y openjdk-11-jdk openjdk-11-jre libxext-dev libxrender-dev libxtst-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

RUN apt-get update && apt-get install -y vim nano zsh curl git sudo

# Create tester user
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/tester && \
    chmod 777 /home/tester && \
    echo "tester:x:${uid}:${gid}::/home/tester:/bin/bash" >> /etc/passwd && \
    echo "tester:x:${uid}:" >> /etc/group && \
    chown ${uid}:${gid} -R /home/tester

# RUN adduser tester sudo
# RUN useradd admin && echo "admin:admin" | chpasswd && adduser admin sudo

# Setup working directory
USER tester
ENV HOME /home/tester
WORKDIR /home/tester


