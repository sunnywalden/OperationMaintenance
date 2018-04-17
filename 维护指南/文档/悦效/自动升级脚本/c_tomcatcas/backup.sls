c_webapps-backup:
  cmd.run:
    - name: for i in 5;do mkdir -p /tmp/backup/tomcatcas${i}/`date +%y%m%d` && cp -r /opt/tomcatcas${i}/webapps/*wall /tmp/backup/tomcatcas${i}/`date +%y%m%d`/;done
