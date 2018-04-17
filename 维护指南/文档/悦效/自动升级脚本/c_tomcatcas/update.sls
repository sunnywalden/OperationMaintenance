ctomcatcas-transfer:
  file.managed:
    - name: /tmp/webapps.war
    - source: salt://c_tomcatcas/files/webapps.war
    - user: root
    - group: root
    - mode: 755
  cmd.run:
    - name: for i in 5;do rm -rf /opt/tomcatcas${i}/work/* && rm -rf /opt/tomcatcas${i}/webapps/*wall/*;done
    - onlyif: test -d /tmp/backup/`date +%y%m%d`/tomcatcas${i}
 
ctomcatcas-update:        #复制自定义的catalina.sh文件
  cmd.run:
    - name: rm -rf /tmp/webapps/* && cd /tmp && mkdir -p /tmp/webapps  && mv webapps.war webapps && cd /tmp/webapps && source /etc/profile && jar -xf webapps.war && for i in 5;do cp -r * /opt/tomcatcas${i}/webapps/*wall/;done
