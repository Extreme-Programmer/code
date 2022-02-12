######: FROM alpine:latest
######: # RUN apt-get -y update
######: COPY ./copy ./root
######: # RUN echo "root-user" | passwd --stdin root

# RUN  apt-get update && apt-get -y upgrade && apt-get install -y openjdk-8-jdk openssh-server

# RUN useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo
# RUN echo 'root-user' | passwd --stdin root

FROM ubuntu:latest
RUN  mkdir -p /var/run/sshd &&\
     apt-get update &&\
     apt-get install -y openssh-server sudo &&\
     useradd -rm -d /home/ubuntu_user -s /bin/bash ubuntu_user &&\
     echo ubuntu_user:password1234 | chpasswd &&\
     echo "root:rootx" | chpasswd &&\
     mkdir /home/ubuntu_user/.ssh/ && chmod 700 /home/ubuntu_user/.ssh
COPY ./copy ./root
COPY id_rsa.pub /home/ubuntu_user/.ssh/authorized_keys
RUN  chown ubuntu_user:ubuntu_user -R /home/ubuntu_user/.ssh && chmod 600 /home/ubuntu_user/.ssh/authorized_keys
CMD  [ "/usr/sbin/sshd" , "-D" ]