# jito-shredstream-install

安装shredstream之前，你需要有shredstream key才能正常接收数据，可以联系我获取：https://t.me/A0xfnzero

#### 1. 将获得的shred_key.json上传到服务器/root目录下
```shell
  # 上传文件
  scp shred_key.json root@your_id:/root/shred_key.json
```

#### 2. 防火墙开启shredstream所需端口
```shell
  # 进入/root目录
  cd /root

  # 下载开启端口脚本
  sudo wget https://github.com/0xfnzero/jito-shredstream-install/blob/main/ufw.sh

  # 赋予脚本可执行权限
  sudo chmod +x ufw.sh

  # 执行脚本
  sudo ./ufw.sh
```

#### 3. 在/root目录下创建shredstream-proxy目录
```shell
  # 进入root目录
  cd /root

  #创建目录
  sudo mkdir -p shredstream-proxy
```

#### 4. 下载jito-shredstream-proxy二进制文件，无需源代码编译
```shell
  # 进入目录
  cd /root/shredstream-proxy

  # 下载二进制文件
  sudo wget https://github.com/jito-labs/shredstream-proxy/releases/download/v0.2.5/jito-shredstream-proxy-x86_64-unknown-linux-gnu

  # 重命名
  sudo mv jito-shredstream-proxy-x86_64-unknown-linux-gnu jito-shredstream-proxy

  # 赋予文件可执行权限
  sudo chmod +x jito-shredstream-proxy
```

#### 5. 下载shredstream启动脚本和终止脚本：
```shell
  # 进入目录
  cd /root/shredstream-proxy

  # 下载启动脚本
  sudo wget https://github.com/0xfnzero/jito-shredstream-install/blob/main/shredstream.sh

  # 下载停止脚本
  sudo wget https://github.com/0xfnzero/jito-shredstream-install/blob/main/stop.sh

  # 赋予脚本可执行权限
  sudo chmod +x shredstream.sh
  sudo chmod +x stop.sh
```

#### 6. 创建shredstream 服务:
```shell
  # 下载服务脚本
  sudo wget https://github.com/0xfnzero/jito-shredstream-install/blob/main/shredstream.service
  
  # 放入到system目录
  sudo mv shredstream.service /etc/systemd/system/

  # 重新加载 systemd 配置
  sudo systemctl daemon-reexec
  sudo systemctl daemon-reload

  # 启动并设置开机启动
  sudo systemctl start shredstream
  sudo systemctl enable shredstream

  # 查看状态/日志
  tail -f shredstream.log
  sudo systemctl status shredstream
  journalctl -u shredstream -f

```

