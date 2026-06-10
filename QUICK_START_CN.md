# 🚀 Jito Shredstream 快速部署

[中文](https://github.com/0xfnzero/jito-shredstream-install/blob/main/QUICK_START_CN.md) | [English](https://github.com/0xfnzero/jito-shredstream-install/blob/main/QUICK_START.md) | [Website](https://fnzero.dev/) | [Telegram](https://t.me/fnzero_group) | [Discord](https://discord.gg/3At4eaUt)

## 一键部署脚本

使用我们的快速部署脚本，只需几个简单步骤即可完成 Jito Shredstream 的部署。

### 📋 前提条件

1. ✅ 服务器 root 权限
2. ✅ Linux 系统
3. ✅ 本仓库已包含 `shred_keypair.json` 文件

### 🎯 快速开始

#### 1. 克隆仓库
在服务器执行：
```bash
sudo su -
cd /root
git clone https://github.com/0xfnzero/jito-shredstream-install.git
cd jito-shredstream-install
```

如需使用自己的 key，请在执行部署脚本前替换 `./shred_keypair.json`。

#### 2. 运行部署脚本
```bash
bash quick-deploy.sh
```

#### 3. 选择区域
```
请选择部署区域:

  1. 🇺🇸 New York
  2. 🇩🇪 Frankfurt  
  3. 🇳🇱 Amsterdam
  4. 🇬🇧 London
  5. 🇺🇸 Salt Lake City
  6. 🇸🇬 Singapore
  7. 🇯🇵 Tokyo
  8. 🇮🇪 Dublin

请输入区域编号 (1-8): 
```

#### 4. 启动服务
```bash
cd /root/shredstream-proxy
./startup-[region].sh    # 根据选择的区域
tail -f shredstream.log  # 查看日志
```

### 🎉 完成！

脚本会自动完成以下操作：
- ✅ 检查密钥文件
- ✅ 复制密钥文件到 `/root/shred_keypair.json`
- ✅ 创建必要目录
- ✅ 配置防火墙规则
- ✅ 下载二进制文件
- ✅ 从当前仓库复制区域启动脚本
- ✅ 设置文件权限

### 📞 支持

- **官网**: https://fnzero.dev/
- **Telegram**: https://t.me/fnzero_group
- **详细文档**: [DEPLOYMENT_GUIDE.md](./DEPLOYMENT_GUIDE.md)
