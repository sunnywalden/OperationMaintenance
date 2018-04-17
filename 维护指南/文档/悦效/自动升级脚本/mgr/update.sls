mgr-transfer:
  file.managed:
    - name: /tmp/mgr.war
    - source: salt://mgr/files/mgr.war
    - user: root
    - group: root
    - mode: 755
  cmd.run:
    - name: for i in 8;do rm -rf /opt/tomcatcas${i}/work/* && rm -rf /opt/tomcatcas${i}/webapps/mgr/*;done
    - onlyif: test -d /tmp/backup/`date +%y%m%d`
 
mgr-update:        #复制自定义的catalina.sh文件
  cmd.run:
    - name: rm -rf /tmp/webapps/* && cd /tmp && mkdir -p /tmp/webapps  && mv mgr.war webapps && cd /tmp/webapps && source /etc/profile && jar -xf mgr.war && for i in 8;do cp -r * /opt/tomcatcas${i}/webapps/mgr/;done
