joyplus-start:
  cmd.run:
    - name: source /etc/profile && /etc/init.d/agent-cpa start && sleep 3s && /etc/init.d/agent-cpc start && sleep 3s
joyplus-start-check:
  cmd.run:
    - name: source /etc/profile && /etc/init.d/agent-cpa status && /etc/init.d/agent-cpc status
