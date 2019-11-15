# -*- coding: utf-8 -*-
# vim: set syntax=yaml ts=2 sw=2 sts=2 et :

#
# Installs 'sd-log' AppVM for collecting and storing logs
# from all SecureDrop related VMs.
# This VM has no network configured.
##
include:
  - sd-workstation-template

sd-log-template:
  qvm.vm:
    - name: sd-log-template
    - clone:
      - source: securedrop-workstation
      - label: red
    - tags:
      - add:
        - sd-workstation
    - require:
      - sls: sd-workstation-template

sd-log:
  qvm.vm:
    - name: sd-log
    - present:
      - template: sd-log-template
      - label: red
    - prefs:
      - netvm: ""
      - autostart: true
    - tags:
      - add:
        - sd-workstation
    - features:
      - enable:
        - service.paxctld
    - require:
      - qvm: sd-log-template

# Allow any SecureDrop VM to log to the centralized log VM
sd-log-dom0-oqubes.Logging:
  file.prepend:
    - name: /etc/qubes-rpc/policy/oqubes.Logging
    - text: |
        @tag:sd-workstation sd-log allow
        @anyvm @anyvm deny
