mgr-start:
  cmd.run:
    - name: for i in 8;do /etc/init.d/tomcatcas${i} start;done
mgr-start-check:
  cmd.run:
    - name: for i in 8;do ps -ef|grep tomcatcas${i}|grep -v grep;done
