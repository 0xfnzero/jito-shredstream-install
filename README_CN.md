# jito-shredstream-install

[中文](https://github.com/0xfnzero/jito-shredstream-install/blob/main/README_CN.md) | [English](https://github.com/0xfnzero/jito-shredstream-install/blob/main/README.md) | [Website](https://fnzero.dev/) | [Telegram](https://t.me/fnzero_group) | [Discord](https://discord.gg/vuazbGkqQE)

## 上游更新：v0.2.14

安装脚本默认使用[上游 v0.2.14](https://github.com/jito-labs/shredstream-proxy/releases/tag/v0.2.14)。该版本弃用 Jito ShredStream，并从 **2026 年 9 月 5 日**起禁用 `shredstream` 命令。区域启动脚本现在会先输出迁移链接并退出，不会先停止已有进程或清空日志。

**以下部署步骤仅安装 proxy，已无法提供可用的区域 Jito ShredStream 订阅。** 请按上游的 [DoubleZero Edge 迁移指南](https://doublezero.xyz/jito-shredstream)迁移。proxy 的 `forward-only` 命令仍可用于另行配置的 UDP/multicast 数据源；安装 proxy 不会自动开通 DoubleZero Edge 接入。

可通过 `SHREDSTREAM_PROXY_VERSION=v0.2.14 bash quick-deploy.sh` 指定安装版本。安装旧二进制不会恢复已经停用的上游服务。

## 这个项目提供什么

本仓库提供 Jito ShredStream proxy 的一键部署和手动部署脚本，适合 Solana validator、RPC 运营者、交易机器人、解析管线和低延迟数据系统接入 ShredStream 交易数据。

| 范围 | 覆盖内容 |
|------|----------|
| 部署能力 | `quick-deploy.sh`、防火墙配置、proxy 二进制下载、key 文件复制、启动/停止脚本 |
| 区域脚本 | New York、Salt Lake City、Dublin、Amsterdam、Frankfurt、London、Singapore、Tokyo |
| 运行环境 | Linux 服务器、root 部署路径、`/root/shredstream-proxy`、按区域启动脚本 |
| 使用场景 | Solana 交易 Bot、DEX 解析器、低延迟流处理、validator 和 RPC 基础设施 |

## 脚本索引

| 脚本 | 用途 |
|------|------|
| `quick-deploy.sh` | 交互式一键部署入口 |
| `startup-[region].sh` | 启动所选区域的 ShredStream proxy |
| `stop.sh` | 停止正在运行的 proxy 进程 |
| `ufw.sh` | 部署过程中使用的防火墙辅助脚本 |

## 🚀 快速部署

**推荐安装方式：先在服务器下载完整仓库代码，再执行仓库里的部署脚本。**

```bash
# 切换到 root 用户
sudo su -

# 克隆仓库到 /root 目录
cd /root
git clone https://github.com/0xfnzero/jito-shredstream-install.git
cd jito-shredstream-install

# 脚本会使用仓库内置的 shred_keypair.json
# 如需使用自己的 key，请先替换 ./shred_keypair.json
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

安装 shredstream 之前需要有效的 `shred_keypair.json` 才能正常接收数据。本仓库默认包含该文件。如果你要使用自己的 key，请替换仓库内的 `shred_keypair.json`，或提前放到 `/root/shred_keypair.json`。

#### 1. 将本仓库克隆到服务器
```shell
  # 进入/root目录
  cd /root

  # 克隆仓库
  git clone https://github.com/0xfnzero/jito-shredstream-install.git
  cd jito-shredstream-install
```

#### 2. 执行一键部署脚本
```shell
  # 脚本会自动配置防火墙、下载 proxy 二进制文件，
  # 复制 key 文件，并从当前仓库复制启动/停止脚本。
  sudo bash quick-deploy.sh
```

#### 3. 启动服务
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
