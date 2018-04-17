mgr-backup:
  cmd.run:
    - name: for i in 8;do mkdir -p /tmp/backup/tomcatcas${i}/`date +%y%m%d` && cp -r /opt/tomcatcas${i}/webapps/mgr /tmp/backup/tomcatcas${i}/`date +%y%m%d`/;done
