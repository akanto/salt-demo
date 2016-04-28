include:
  - ambari.base

haveged:
  pkg.installed: []
  service.running:
    - enable: True

ambari-server:
  pkg.latest:
    - require:
      - sls: ambari.base

#/etc/rc.d/init.d/ambari-server:
#  file.absent

/opt/ambari-server/ambari-server-init.sh:
  file.managed:
    - makedirs: True
    - source: salt://ambari/systemd/ambari-server-init.sh
    - mode: 744

/etc/systemd/system/ambari-server.service:
  file.managed:
    - source: salt://ambari/systemd/ambari-server.service

start-ambari-server:
  service.running:
    - enable: True
    - name: ambari-server
    - watch:
        - pkg: ambari-server
        - file: /opt/ambari-server/ambari-server-init.sh
        - file: /etc/systemd/system/ambari-server.service