c_tomcat-start:
  cmd.run:
    - name: for i in 5;do /etc/init.d/tomcatcas${i} start;done
ctomcat-start-check:
  cmd.run:
    - name: for i in 5;do ps -ef|grep tomcatcas${i}|grep -v grep;done
