FROM ubuntu:18.04

# Install Java
RUN sed 's/main$/main universe/' -i /etc/apt/sources.list && \
    apt-get update && apt-get install -y wget ca-certificates software-properties-common && \
    apt-get update && apt-get install -y openjdk-8-jdk openjdk-8-jre libxext-dev libxrender-dev libxtst-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

RUN apt-get update && apt-get install -y vim nano zsh curl git sudo

# Create tester user
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/tester && \
    chmod 777 /home/tester && \
    echo "tester:x:${uid}:${gid}:tester,,,:/home/tester:/bin/bash" >> /etc/passwd && \
    echo "tester:x:${uid}:" >> /etc/group && \
    chown ${uid}:${gid} -R /home/tester

RUN adduser tester sudo
RUN useradd admin && echo "admin:admin" | chpasswd && adduser admin sudo
RUN rm -rf /home/tester/.java/.userPrefs
RUN chmod 777 /home/terster/.java
# Setup working directory
USER tester
ENV HOME /home/tester
WORKDIR /home/tester


