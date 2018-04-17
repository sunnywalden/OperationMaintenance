joyplus-stop:
  cmd.run:
    - name: source /etc/profile && /etc/init.d/agent-cpa stop && /etc/init.d/agent-cpc stop  && ps -ef|grep 'joyplus-agent'|grep -v grep|awk '{print $2}'|xargs -n1 -i kill -9 {}
joyplus-cpa-stop-check:
  cmd.run:
    - name: source /etc/profile && re=`/etc/init.d/agent-cpa status|awk '{print $1}'` && if [[ "$re" = *Not* ]]; then echo "cpa stopped successful";fi
joyplus-cpc-stop-check:
  cmd.run:
    - name: source /etc/profile && re=`/etc/init.d/agent-cpc status|awk '{print $1}'` && if [[ "$re" = *Not* ]]; then echo "cpc stopped successful";fi
