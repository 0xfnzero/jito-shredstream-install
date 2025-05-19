# jito-shredstream-install
### jito-shredstream installation guide

安装shredstream之前，需要获得一个shredstream key才能正常接收数据，可以联系我：https://t.me/A0xfnzero

#### 1. 将获得的shred_key.json上传到服务器/root目录下
```shell
  # 上传文件
  scp shred_key.json root@your_id:/root/shred_key.json
```

#### 2. 在/root目录下创建shredstream-proxy目录
```shell
  # 进入root目录
  cd /root

  #创建目录
  mkdir -p shredstream-proxy
```

#### 3. 下载jito-shredstream-proxy二进制文件，无需源代码编译
```shell
  # 进入目录
  cd /root/shredstream-proxy

  # 下载二进制文件
  wget https://github.com/jito-labs/shredstream-proxy/releases/download/v0.2.5/jito-shredstream-proxy-x86_64-unknown-linux-gnu

  # 重命名
  mv jito-shredstream-proxy-x86_64-unknown-linux-gnu jito-shredstream-proxy

  # 设置可执行权限
  chmod +x jito-shredstream-proxy
```

#### 4. 下载shredstream启动脚本和终止脚本：
```shell
  # 进入目录
  cd /root/shredstream-proxy

  # 下载启动脚本
  wget https://github.com/0xfnzero/jito-shredstream-install/blob/main/shredstream.sh

  # 下载停止脚本
  wget https://github.com/0xfnzero/jito-shredstream-install/blob/main/stop.sh
```

#### 5. 创建shredstream 服务:
```shell
  # 下载服务脚本
  wget https://github.com/0xfnzero/jito-shredstream-install/blob/main/shredstream.service
  # 放入到system目录
  sudo mv shredstream.service /etc/systemd/system/

  # 重新加载 systemd 配置
  sudo systemctl daemon-reexec
  sudo systemctl daemon-reload

  # 启动并设置开机启动
  sudo systemctl start shredstream
  sudo systemctl enable shredstream

  # 查看状态/日志
  sudo systemctl status shredstream
  journalctl -u shredstream -f

```

