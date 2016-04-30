
{%- set advertise_addr = salt['grains.get']('consul:advertise_addr', '') %}
{%- set is_server = salt['grains.get']('consul:server', 'False') %}
{%- set node_name = salt['grains.get']('consul:node_name', '') %}


{%- set consul = {} %}
{%- do consul.update({
    'advertise_addr': advertise_addr,
    'is_server': is_server,
    'node_name': node_name
}) %}