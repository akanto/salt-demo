/etc/yum.repos.d/ambari.repo:
  file.managed:
    - source: salt://ambari/files/ambari.repo


ambari-agent:
  pkg.latest:
    - require:
      - file: /etc/yum.repos.d/ambari.repo
  service.running:
    - enable: True