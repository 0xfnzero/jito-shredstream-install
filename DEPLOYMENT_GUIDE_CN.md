# Jito Shredstream 详细部署指南

[中文](https://github.com/0xfnzero/jito-shredstream-install/blob/main/DEPLOYMENT_GUIDE_CN.md) | [English](https://github.com/0xfnzero/jito-shredstream-install/blob/main/DEPLOYMENT_GUIDE.md) | [Website](https://fnzero.dev/) | [Telegram](https://t.me/fnzero_group)

## 概述

本指南提供 Jito Shredstream 的详细手动部署步骤，适合希望了解每个部署细节的用户。

> **想要快速部署？** 请查看 [快速部署指南](QUICK_START_CN.md)

## 前提条件

在开始部署之前，请确保您已经：

1. ✅ 获得了 `shred_keypair.json` 文件
2. ✅ 拥有服务器的 root 权限
3. ✅ 服务器运行 Ubuntu 系统
4. ✅ 网络连接正常

## 详细部署步骤

### 1. 上传密钥文件

将您的 `shred_keypair.json` 文件上传到服务器的 `/root` 目录下：

```bash
# 将shred_keypair.json上传到服务器/root目录下
scp shred_keypair.json root@your_server_ip:/root/shred_keypair.json
```

### 2. 配置防火墙

#### 2.1 下载防火墙配置脚本

```bash
# 进入/root目录
cd /root

# 下载开启端口脚本
wget https://github.com/0xfnzero/jito-shredstream-install/releases/download/v1.2/ufw.sh

# 赋予脚本可执行权限
chmod +x ufw.sh
```

#### 2.2 执行防火墙配置

```bash
# 执行脚本
./ufw.sh
```

防火墙脚本会自动配置以下规则：
- **端口开放**: 20000/udp, 10800/tcp
- **IP白名单**: 各区域的Jito服务器IP地址

### 3. 创建工作目录

```bash
# 进入root目录
cd /root

# 创建shredstream-proxy目录
mkdir -p shredstream-proxy

# 进入工作目录
cd shredstream-proxy
```

### 4. 下载二进制文件

#### 4.1 下载jito-shredstream-proxy二进制文件

```bash
# 下载二进制文件
wget https://github.com/jito-labs/shredstream-proxy/releases/download/v0.2.13/jito-shredstream-proxy-x86_64-unknown-linux-gnu

# 重命名
mv jito-shredstream-proxy-x86_64-unknown-linux-gnu jito-shredstream-proxy

# 赋予文件可执行权限
chmod +x jito-shredstream-proxy
```

### 5. 下载启动和停止脚本

根据您选择的区域，下载对应的启动脚本：

#### 🇺🇸 New York
```bash
wget https://github.com/0xfnzero/jito-shredstream-install/releases/download/v1.2/startup-ny.sh
chmod +x startup-ny.sh
```

#### 🇩🇪 Frankfurt
```bash
wget https://github.com/0xfnzero/jito-shredstream-install/releases/download/v1.2/startup-fra.sh
chmod +x startup-fra.sh
```

#### 🇳🇱 Amsterdam
```bash
wget https://github.com/0xfnzero/jito-shredstream-install/releases/download/v1.2/startup-ams.sh
chmod +x startup-ams.sh
```

#### 🇬🇧 London
```bash
wget https://github.com/0xfnzero/jito-shredstream-install/releases/download/v1.2/startup-london.sh
chmod +x startup-london.sh
```

#### 🇺🇸 Salt Lake City
```bash
wget https://github.com/0xfnzero/jito-shredstream-install/releases/download/v1.2/startup-slc.sh
chmod +x startup-slc.sh
```

#### 🇸🇬 Singapore
```bash
wget https://github.com/0xfnzero/jito-shredstream-install/releases/download/v1.2/startup-singapore.sh
chmod +x startup-singapore.sh
```

#### 🇯🇵 Tokyo
```bash
wget https://github.com/0xfnzero/jito-shredstream-install/releases/download/v1.2/startup-tokyo.sh
chmod +x startup-tokyo.sh
```

#### 🇮🇪 Dublin
```bash
wget https://github.com/0xfnzero/jito-shredstream-install/releases/download/v1.2/startup-dublin.sh
chmod +x startup-dublin.sh
```

#### 下载停止脚本

```bash
wget https://github.com/0xfnzero/jito-shredstream-install/releases/download/v1.2/stop.sh
chmod +x stop.sh
```

### 6. 启动服务

```bash
# 启动服务（根据您下载的脚本）
./startup-ny.sh      # 纽约
./startup-fra.sh     # 法兰克福
./startup-ams.sh     # 阿姆斯特丹
./startup-london.sh  # 伦敦
./startup-slc.sh     # 盐湖城
./startup-singapore.sh # 新加坡
./startup-tokyo.sh   # 东京
./startup-dublin.sh  # 都柏林

# 查看日志
tail -f shredstream.log
```

## 区域配置详情

| 区域 | 脚本名称 | Block Engine URL | 区域代码 |
|------|----------|------------------|----------|
| 🇺🇸 New York | startup-ny.sh | https://ny.mainnet.block-engine.jito.wtf | ny |
| 🇩🇪 Frankfurt | startup-fra.sh | https://frankfurt.mainnet.block-engine.jito.wtf | frankfurt |
| 🇳🇱 Amsterdam | startup-ams.sh | https://amsterdam.mainnet.block-engine.jito.wtf | amsterdam |
| 🇬🇧 London | startup-london.sh | https://london.mainnet.block-engine.jito.wtf | london |
| 🇺🇸 Salt Lake City | startup-slc.sh | https://slc.mainnet.block-engine.jito.wtf | slc |
| 🇸🇬 Singapore | startup-singapore.sh | https://singapore.mainnet.block-engine.jito.wtf | singapore |
| 🇯🇵 Tokyo | startup-tokyo.sh | https://tokyo.mainnet.block-engine.jito.wtf | tokyo |
| 🇮🇪 Dublin | startup-dublin.sh | https://dublin.mainnet.block-engine.jito.wtf | dublin |

## 服务管理

### 启动服务
```bash
cd /root/shredstream-proxy
./startup-[region].sh
```

### 查看日志
```bash
tail -f /root/shredstream-proxy/shredstream.log
```

### 停止服务
```bash
cd /root/shredstream-proxy
./stop.sh
```

### 检查服务状态
```bash
# 检查进程是否运行
ps aux | grep jito-shredstream-proxy

# 检查PID文件
cat /root/shredstream-proxy/shredstream.pid
```

## 故障排除

### 常见问题

1. **权限错误**
   ```bash
   # 确保以root权限运行
   sudo su -
   ```

2. **密钥文件不存在**
   ```bash
   # 检查密钥文件是否存在
   ls -la /root/shred_keypair.json
   ```

3. **端口被占用**
   ```bash
   # 检查端口使用情况
   netstat -tulpn | grep :10800
   netstat -tulpn | grep :20000
   ```

4. **服务启动失败**
   ```bash
   # 查看详细日志
   tail -f /root/shredstream-proxy/shredstream.log
   ```

### 日志分析

日志文件位置：`/root/shredstream-proxy/shredstream.log`

常见日志信息：
- `Starting new jito-shredstream-proxy...` - 服务启动
- `Started with PID` - 服务启动成功
- 连接错误信息 - 网络或配置问题

## 文件结构

部署完成后的文件结构：

```
/root/
├── shred_keypair.json          # 认证密钥文件
└── shredstream-proxy/
    ├── jito-shredstream-proxy  # 主程序二进制文件
    ├── startup-[region].sh     # 区域启动脚本
    ├── stop.sh                 # 停止脚本
    ├── ufw.sh                  # 防火墙配置脚本
    ├── shredstream.log         # 运行日志
    └── shredstream.pid         # 进程ID文件
```

## 更新和维护

### 更新二进制文件
```bash
cd /root/shredstream-proxy

# 停止服务
./stop.sh

# 下载新版本
wget https://github.com/jito-labs/shredstream-proxy/releases/download/v[version]/jito-shredstream-proxy-x86_64-unknown-linux-gnu

# 替换旧文件
mv jito-shredstream-proxy-x86_64-unknown-linux-gnu jito-shredstream-proxy
chmod +x jito-shredstream-proxy

# 重新启动
./startup-[region].sh
```

### 清理日志
```bash
# 清空日志文件
> /root/shredstream-proxy/shredstream.log
```

## 防火墙配置详情

防火墙脚本会自动配置以下IP白名单：

### Amsterdam
- 74.118.140.240, 202.8.8.174
- 64.130.42.228, 64.130.43.92, 64.130.55.26
- 64.130.42.227, 64.130.43.19, 64.130.55.28

### Dublin
- 64.130.61.138, 64.130.61.139, 64.130.61.140

### Frankfurt
- 64.130.50.14, 64.130.57.46, 64.130.40.25
- 64.130.57.99, 64.130.57.171, 64.130.40.23
- 64.130.40.22, 64.130.40.21

### London
- 142.91.127.175, 88.211.250.116, 88.211.250.140
- 88.211.250.172, 88.211.250.108, 88.211.250.76
- 88.211.251.36

### New York
- 141.98.216.96, 64.130.48.56, 64.130.34.186
- 64.130.34.143, 64.130.34.142, 64.130.34.189
- 64.130.34.190, 64.130.34.141

### Salt Lake City
- 64.130.53.8, 64.130.53.57, 64.130.53.81
- 64.130.53.90, 64.130.53.82, 64.130.33.181
- 64.130.33.88

### Singapore
- 202.8.11.224, 202.8.11.173, 202.8.11.102
- 202.8.11.103, 202.8.11.104

### Tokyo
- 202.8.9.160, 202.8.9.19, 202.8.9.22
- 64.130.49.109, 208.91.109.102

## 支持

- **官网**: https://fnzero.dev/
- **Telegram群组**: https://t.me/fnzero_group
- **GitHub仓库**: https://github.com/0xfnzero/jito-shredstream-install
- **快速部署**: [QUICK_START_CN.md](QUICK_START_CN.md)

## 版本信息

- **Shredstream Proxy版本**: v0.2.13
- **安装脚本版本**: v1.3
- **最后更新**: 2024年9月

---

**注意**: 本指南专注于详细的手动部署步骤。如果您希望快速部署，请使用 [快速部署指南](QUICK_START_CN.md)。
