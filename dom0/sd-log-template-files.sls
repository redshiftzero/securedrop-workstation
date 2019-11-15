# -*- coding: utf-8 -*-
# vim: set syntax=yaml ts=2 sw=2 sts=2 et :

# We should package this so we can easily update
sd-log-script:
  file.managed:
    - name: /usr/sbin/oqubes-logging
    - source: salt://sd/sd-log/oqubes-logging
    - user: root
    - group: root
    - mode: 755

sd-log-qrexec:
  file.managed:
    - name: /etc/qubes-rpc/oqubes.Logging
    - source: salt://sd/sd-log/oqubes.Logging
    - user: root
    - group: root
    - mode: 755
