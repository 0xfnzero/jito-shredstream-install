#!/bin/bash

set -e  # 脚本有报错就终止

# 开启 UFW（如果没启用）
ufw enable

# Amsterdam
ufw allow from 74.118.140.240
ufw allow from 202.8.8.174
ufw allow from 64.130.42.228
ufw allow from 64.130.43.92
ufw allow from 64.130.55.26
ufw allow from 64.130.42.227
ufw allow from 64.130.43.19
ufw allow from 64.130.55.28

# Dublin
ufw allow from 64.130.61.138
ufw allow from 64.130.61.139
ufw allow from 64.130.61.140

# Frankfurt
ufw allow from 64.130.50.14
ufw allow from 64.130.57.46
ufw allow from 64.130.40.25
ufw allow from 64.130.57.99
ufw allow from 64.130.57.171
ufw allow from 64.130.40.23
ufw allow from 64.130.40.22
ufw allow from 64.130.40.21

# London
ufw allow from 142.91.127.175
ufw allow from 88.211.250.116
ufw allow from 88.211.250.140
ufw allow from 88.211.250.172
ufw allow from 88.211.250.108
ufw allow from 88.211.250.76
ufw allow from 88.211.251.36

# New York
ufw allow from 141.98.216.96
ufw allow from 64.130.48.56
ufw allow from 64.130.34.186
ufw allow from 64.130.34.143
ufw allow from 64.130.34.142
ufw allow from 64.130.34.189
ufw allow from 64.130.34.190
ufw allow from 64.130.34.141

# Salt Lake City
ufw allow from 64.130.53.8
ufw allow from 64.130.53.57
ufw allow from 64.130.53.81
ufw allow from 64.130.53.90
ufw allow from 64.130.53.82
ufw allow from 64.130.33.181
ufw allow from 64.130.33.88

# Singapore
ufw allow from 202.8.11.224
ufw allow from 202.8.11.173
ufw allow from 202.8.11.102
ufw allow from 202.8.11.103
ufw allow from 202.8.11.104

# Tokyo
ufw allow from 202.8.9.160
ufw allow from 202.8.9.19
ufw allow from 202.8.9.22
ufw allow from 64.130.49.109
ufw allow from 208.91.109.102


ufw allow 20000/udp 
ufw allow 10800
