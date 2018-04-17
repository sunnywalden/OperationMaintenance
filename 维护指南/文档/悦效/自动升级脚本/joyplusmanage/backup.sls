joyplusmanage-backup:
  cmd.run:
    - name: mkdir -p /tmp/backup/joyplusmanage/`date +%y%m%d` && cp -r /opt/joyplus-manager/joyplus-manage-2.0.jar /tmp/backup/joyplusmanage/`date +%y%m%d`/
