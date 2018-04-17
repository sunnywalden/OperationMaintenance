joyplusmanage-start:
  cmd.run:
    - name: source /etc/profile && /etc/init.d/joyplus-manage start
joyplusmanage-start-check:
  cmd.run:
    - name: source /etc/profile && /etc/init.d/joyplus-manage status
