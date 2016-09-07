FROM centos:7

#Setting up systemd
ENV container docker
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
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
RUN yum install -y salt-master salt-api && yum clean all

RUN  yum install -y  python-pygit2 GitPython && yum clean all

COPY config/custom.conf /etc/salt/master.d/custom.conf

RUN systemctl enable salt-master
RUN systemctl enable salt-api

RUN yum install -y wget unzip && yum clean all
###ADD https://github.com/Lothiraldan/saltpad/releases/download/v0.2/dist.zip /opt/dist.zip
COPY dist-v0.3.1.zip /opt/dist.zip
RUN unzip /opt/dist.zip -d /opt/saltpad
RUN mv /opt/saltpad/dist /code
COPY config/settings.json /code/static/settings.json

COPY salt /srv/salt
RUN mkdir -p /srv/pillar

# salt-key -L
# salt '*' test.ping

RUN export NEW_USER=saltuser && adduser ${NEW_USER} && usermod -G wheel ${NEW_USER} && echo "${NEW_USER}:saltpass"| chpasswd
