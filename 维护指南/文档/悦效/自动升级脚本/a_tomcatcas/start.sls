a_tomcat-start:
  cmd.run:
    - name: for i in 1 2 6;do /etc/init.d/tomcatcas${i} start;done
atomcat-start-check:
  cmd.run:
    - name: for i in 1 2 6;do ps -ef|grep tomcatcas${i}|grep -v grep;done
