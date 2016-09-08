nginx:
  pkg.installed: []

sites_hello:
  file.managed:
    - name: /usr/share/nginx/html/hello.html
    - source: salt://nginx/sites/hello.html
    - mode: 0644
  service.running:
    - name: nginx
    - watch:
      - file: /usr/share/nginx/html/hello.html