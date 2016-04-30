
{%- set advertise_addr = salt['grains.get']('consul:advertise_addr', '') %}


{%- set consul = {} %}
{%- do consul.update({
    'advertise_addr': advertise_addr
}) %}