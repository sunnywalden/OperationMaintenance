joypluscas-transfer:
  file.managed:
    - name: /tmp/joyplus-agent-web-2.0.jar
    - source: salt://joyplus/files/joyplus-agent-web-2.0.jar
    - user: root
    - group: root
    - mode: 755
  cmd.run:
    - name: rm -rf /opt/joyplus-agent/cp*/joyplus-agent-web-2.0.jar && rm -rf /opt/joyplus-agent/cpa/logs/* && rm -rf /opt/joyplus-agent/cpc/logs/*
    - onlyif: test -d /tmp/backup/joyplus/`date +%y%m%d`/

joypluscas-update:        #复制自定义的catalina.sh文件
  cmd.run:
    - name: cp -f /tmp/joyplus-agent-web-2.0.jar /opt/joyplus-agent/cpc/ && cp -f /tmp/joyplus-agent-web-2.0.jar /opt/joyplus-agent/cpa/
