include:
  - ambari.base

ambari-server:
  pkg.latest:
    - require:
      - file: /etc/yum.repos.d/ambari.repo
  service.running:
    - enable: True