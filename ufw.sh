#!/bin/bash

set -e  # 脚本有报错就终止

# 开启 UFW（如果没启用）
ufw enable

ufw allow from 74.118.140.240 
ufw allow from 64.130.52.138 
ufw allow from 202.8.8.177 
ufw allow from 64.130.55.26 
ufw allow from 64.130.55.174 
ufw allow from 64.130.55.28 
ufw allow from 64.130.50.14 
ufw allow from 64.130.57.199 
ufw allow from 64.130.57.99 
ufw allow from 64.130.57.171 
ufw allow from 64.130.40.23 
ufw allow from 64.130.40.22 
ufw allow from 64.130.40.21 
ufw allow from 141.98.216.96 
ufw allow from 64.130.51.137 
ufw allow from 64.130.51.41 
ufw allow from 64.130.59.205 
ufw allow from 64.130.34.189 
ufw allow from 64.130.34.190 
ufw allow from 64.130.34.141 
ufw allow from 64.130.34.142 
ufw allow from 64.130.53.8 
ufw allow from 64.130.53.88 
ufw allow from 64.130.53.90 
ufw allow from 64.130.53.82 
ufw allow from 202.8.9.160 
ufw allow from 202.8.9.22 
ufw allow from 208.91.107.252 
ufw allow from 64.130.49.142 
ufw allow 20000/udp 
ufw allow 10800