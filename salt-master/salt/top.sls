base:
  'roles:consul_server':
    - match: grain
    - debug.all

  'roles:ambari_server':
    - match: grain
    - ambari.server

  'roles:ambari_agent':
    - match: grain
    - ambari.agent

