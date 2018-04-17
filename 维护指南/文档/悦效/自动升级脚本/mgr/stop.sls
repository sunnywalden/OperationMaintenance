mgr-stop:
  cmd.run:
    - name: for i in 8;do /etc/init.d/tomcatcas${i} stop && ps -ef|grep tomcatcas${i}|grep -v grep |awk '{print $2}'|xargs -n1 -i kill -9 {};done
mgr-stop-check:
  cmd.run:
    - name: for i in 8;do ps -ef|grep tomcatcas${i};done
#    - name: for i in 8;do ps -ef|grep tomcatcas${i}|grep -v grep && if [ $? -eq 1 ]; then echo "tomcatcas${i} stopped successful";fi;done
