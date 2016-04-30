{%- from 'consul/settings.sls' import consul with context %}

/opt/consul/stop.sh:
  file.managed:
    - makedirs: True
    - source: salt://consul/systemd/stop.sh
    - mode: 744

/etc/systemd/system/consul.service:
  file.managed:
    - source: salt://consul/systemd/consul.service


/etc/cloudbreak/consul/consul.json:
  file.managed:
    - makedirs: True
    - source: salt://consul/config/consul.json
    - template: jinja
    - context:
        advertise_addr: {{ consul.advertise_addr }}
        is_server: {{ consul.is_server }}
        node_name: {{ consul.node_name }}

