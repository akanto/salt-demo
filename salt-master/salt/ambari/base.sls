/etc/yum.repos.d/ambari.repo:
  file.managed:
    - source: salt://ambari/files/ambari.repo
