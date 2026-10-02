# 🚀 Jito Shredstream 快速部署

[中文](https://github.com/0xfnzero/jito-shredstream-install/blob/main/QUICK_START_CN.md) | [English](https://github.com/0xfnzero/jito-shredstream-install/blob/main/QUICK_START.md) | [Website](https://fnzero.dev/) | [Telegram](https://t.me/fnzero_group) | [Discord](https://discord.gg/3At4eaUt)

## 上游更新：v0.2.14

安装脚本默认使用[上游 v0.2.14](https://github.com/jito-labs/shredstream-proxy/releases/tag/v0.2.14)。该版本弃用 Jito ShredStream，并从 **2026 年 9 月 5 日**起禁用 `shredstream` 命令。区域启动脚本现在会先输出迁移链接并退出，不会先停止已有进程或清空日志。

**以下部署步骤仅安装 proxy，已无法提供可用的区域 Jito ShredStream 订阅。** 请按上游的 [DoubleZero Edge 迁移指南](https://doublezero.xyz/jito-shredstream)迁移。proxy 的 `forward-only` 命令仍可用于另行配置的 UDP/multicast 数据源；安装 proxy 不会自动开通 DoubleZero Edge 接入。

可通过 `SHREDSTREAM_PROXY_VERSION=v0.2.14 bash quick-deploy.sh` 指定安装版本。安装旧二进制不会恢复已经停用的上游服务。

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
