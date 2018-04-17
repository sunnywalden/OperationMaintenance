joyplusmanage-stop:
  cmd.run:
    - name: source /etc/profile && /etc/init.d/joyplus-manage stop  && ps -ef|grep 'joyplus-manage'|grep -v grep|awk '{print $2}'|xargs -n1 -i kill -9 {}
joyplusmanage-stop-check:
  cmd.run:
    - name: source /etc/profile && re=`/etc/init.d/joyplus-manage status|awk '{print $1}'` && if [[ "$re" = *Not* ]]; then echo "manage stopped successful";fi
