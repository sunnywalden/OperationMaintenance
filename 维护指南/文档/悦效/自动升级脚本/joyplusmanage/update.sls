joyplusmanage-transfer:
  file.managed:
    - name: /tmp/joyplus-manage-2.0.jar
    - source: salt://joyplusmanage/files/joyplus-manage-2.0.jar
    - user: root
    - group: root
    - mode: 755
  cmd.run:
    - name: rm -rf /opt/joyplus-manager/joyplus-manage-2.0.jar && rm -rf /opt/joyplus-manager/logs/*
    - onlyif: test -d /tmp/backup/joyplusmanage/`date +%y%m%d`/
 
joyplusmanage-update:
  cmd.run:
    - name: cp -r /tmp/joyplus-manage-2.0.jar /opt/joyplus-manager/
