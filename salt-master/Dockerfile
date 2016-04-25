FROM centos:7.2.1511
MAINTAINER Hortonworks

#Setting up systemd
ENV container docker
RUN yum -y swap -- remove fakesystemd -- install systemd systemd-libs
RUN yum -y update; yum clean all; \
(cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;
VOLUME [ "/sys/fs/cgroup" ]
ENTRYPOINT ["/usr/sbin/init"]


RUN yum install -y epel-release && yum clean all
#RUN yum install -y python-pip && yum clean all
#RUN pip install cherrypy
RUN yum install -y salt-master salt-api && yum clean all
COPY config/master /etc/salt/master
RUN systemctl enable salt-master
RUN systemctl enable salt-api

RUN yum install -y nginx wget unzip && yum clean all
###ADD https://github.com/Lothiraldan/saltpad/releases/download/v0.2/dist.zip /opt/dist.zip
COPY dist-v0.3.1.zip /opt/dist.zip
RUN unzip /opt/dist.zip -d /opt/saltpad
COPY config/settings.json /opt/saltpad/dist/static/settings.json
##
COPY config/nginx.conf /etc/nginx/nginx.conf
RUN systemctl enable nginx

COPY salt /srv/salt
RUN mkdir -p /srv/pillar

# salt-key -L
# salt '*' test.ping

RUN export NEW_USER=saltuser && adduser ${NEW_USER} && usermod -G wheel ${NEW_USER} && echo "${NEW_USER}:saltpass"| chpasswd
