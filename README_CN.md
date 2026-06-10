# jito-shredstream-install

[中文](https://github.com/0xfnzero/jito-shredstream-install/blob/main/README_CN.md) | [English](https://github.com/0xfnzero/jito-shredstream-install/blob/main/README.md) | [Website](https://fnzero.dev/) | [Telegram](https://t.me/fnzero_group) | [Discord](https://discord.gg/vuazbGkqQE)

## 🚀 快速部署

**推荐安装方式：先在服务器下载完整仓库代码，再执行仓库里的部署脚本。**

```bash
# 切换到 root 用户
sudo su -

# 克隆仓库到 /root 目录
cd /root
git clone https://github.com/0xfnzero/jito-shredstream-install.git
cd jito-shredstream-install

# 执行前请先把密钥文件上传到 /root/shred_keypair.json
bash quick-deploy.sh

# 部署完成后启动所选区域服务
cd /root/shredstream-proxy
./startup-[region].sh
tail -f shredstream.log
```

👉 **[快速部署指南](QUICK_START_CN.md)** - 基于完整仓库的一键部署脚本，支持8个区域选择

👉 **[详细部署指南](DEPLOYMENT_GUIDE_CN.md)** - 完整的部署文档和故障排除

---

## 📋 手动部署步骤

安装shredstream之前，你需要有shredstream key才能正常接收数据

#### 1. 将获得的shred_keypair.json上传到服务器/root目录下
```shell
  # 上传文件
  scp shred_keypair.json root@your_id:/root/shred_keypair.json
```

#### 2. 将本仓库克隆到服务器
```shell
  # 进入/root目录
  cd /root

  # 克隆仓库
  git clone https://github.com/0xfnzero/jito-shredstream-install.git
  cd jito-shredstream-install
```

#### 3. 执行一键部署脚本
```shell
  # 脚本会自动配置防火墙、下载 proxy 二进制文件，
  # 并从当前仓库复制启动/停止脚本。
  sudo bash quick-deploy.sh
```

#### 4. 启动服务
```shell
  # 进入目录
  cd /root/shredstream-proxy

  # 启动脚本，请将 startup-ny.sh 替换为你选择的区域脚本
  ./startup-ny.sh

  # 查看日志
  tail -f shredstream.log

  # 停止服务
  ./stop.sh
```

## 📚 相关文档

- **[快速部署指南](QUICK_START_CN.md)** - 一键部署脚本使用说明
- **[详细部署指南](DEPLOYMENT_GUIDE_CN.md)** - 完整的部署文档和故障排除
- **[快速部署脚本](quick-deploy.sh)** - 自动化部署脚本

## 📞 支持

- **官网**: https://fnzero.dev/
- **Telegram群组**: https://t.me/fnzero_group

