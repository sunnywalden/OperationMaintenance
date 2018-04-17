joyplus-backup:
  cmd.run:
    - name: mkdir -p /tmp/backup/joyplus/`date +%y%m%d` && cp -r /opt/joyplus-agent/cpa/joyplus-agent-web-2.0.jar /tmp/backup/joyplus/`date +%y%m%d`/
