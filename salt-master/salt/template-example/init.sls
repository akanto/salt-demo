
/opt/hello.conf:
  file.managed:
    - source: salt://template-example/template/hello.conf
    - template: jinja
