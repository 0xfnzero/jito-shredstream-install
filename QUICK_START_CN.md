# 🚀 Jito Shredstream 快速部署

[中文](https://github.com/0xfnzero/jito-shredstream-install/blob/main/QUICK_START_CN.md) | [English](https://github.com/0xfnzero/jito-shredstream-install/blob/main/QUICK_START.md) | [Website](https://fnzero.dev/) | [Telegram](https://t.me/fnzero_group)

## 一键部署脚本

使用我们的快速部署脚本，只需几个简单步骤即可完成 Jito Shredstream 的部署。

### 📋 前提条件

1. ✅ 已获得 `shred_key.json` 文件
2. ✅ 服务器 root 权限
3. ✅ Linux 系统

### 🎯 快速开始

#### 1. 下载部署脚本
```bash
wget https://github.com/0xfnzero/jito-shredstream-install/raw/main/quick-deploy.sh
chmod +x quick-deploy.sh
```

#### 2. 上传密钥文件
```bash
scp shred_key.json root@your_server:/root/shred_keypair.json
```

#### 3. 运行部署脚本
```bash
sudo ./quick-deploy.sh
```

#### 4. 选择区域
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

#### 5. 启动服务
```bash
cd /root/shredstream-proxy
./startup-[region].sh    # 根据选择的区域
tail -f shredstream.log  # 查看日志
```

### 🎉 完成！

脚本会自动完成以下操作：
- ✅ 检查密钥文件
- ✅ 创建必要目录
- ✅ 配置防火墙规则
- ✅ 下载二进制文件
- ✅ 下载区域启动脚本
- ✅ 设置文件权限

### 📞 支持

- **官网**: https://fnzero.dev/
- **Telegram**: https://t.me/fnzero_group
- **详细文档**: [DEPLOYMENT_GUIDE.md](./DEPLOYMENT_GUIDE.md)

