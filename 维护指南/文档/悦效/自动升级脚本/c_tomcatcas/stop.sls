c_tomcat-stop:
  cmd.run:
    - name: for i in 5;do /etc/init.d/tomcatcas${i} stop && ps -ef|grep tomcatcas${i}|grep -v grep |awk '{print $2}'|xargs -n1 -i kill -9 {};done
ctomcat-stop-check:
  cmd.run:
    - name: for i in 5;do ps -ef|grep tomcatcas${i};done
#    - name: for i in 5;do ps -ef|grep tomcatcas${i}|grep -v grep && if [ $? -eq 1 ]; then echo "tomcatcas${i} stopped successful";fi;done
