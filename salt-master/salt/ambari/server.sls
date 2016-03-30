include:
  - ambari.base

ambari-server:
  pkg.latest:
    - require:
      - sls: ambari.base
  service.running:
    - enable: True