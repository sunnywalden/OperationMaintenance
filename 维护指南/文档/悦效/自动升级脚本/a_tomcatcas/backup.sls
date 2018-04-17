a_webapps-backup:
  cmd.run:
    - name: mkdir -p /tmp/backup/`date +%y%m%d` && for i in 1 2 6;do cp -r /opt/tomcatcas${i}/webapps/*wall /tmp/backup/tomcatcas${i}/`date +%y%m%d`/;done
