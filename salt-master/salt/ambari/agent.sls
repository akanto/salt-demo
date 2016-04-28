include:
  - ambari.base

ambari-agent:
  pkg.latest:
    - require:
      - sls: ambari.base

/etc/rc.d/init.d/ambari-server
  file.absent

/opt/ambari-agent/ambari-agent-init.sh:
  file.managed:
    - makedirs: True
    - source: salt://ambari/systemd/ambari-agent-init.sh
    - mode: 744

/etc/systemd/system/ambari-agent.service:
  file.managed:
    - source: salt://ambari/systemd/ambari-agent.service

start-ambari-agent:
  service.running:
    - enable: True
    - name: ambari-agent
    - watch:
        - pkg: ambari-agent
        - file: /opt/ambari-agent/ambari-agent-init.sh
        - file: /etc/systemd/system/ambari-agent.service