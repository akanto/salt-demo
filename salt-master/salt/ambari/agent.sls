include:
  - ambari.base

ambari-agent:
  pkg.latest:
    - require:
      - sls: ambari.base
  service.running:
    - enable: True