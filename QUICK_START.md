# 🚀 Jito Shredstream Quick Deployment

[中文](https://github.com/0xfnzero/jito-shredstream-install/blob/main/QUICK_START_CN.md) | [English](https://github.com/0xfnzero/jito-shredstream-install/blob/main/QUICK_START.md) | [Website](https://fnzero.dev/) | [Telegram](https://t.me/fnzero_group) | [Discord](https://discord.gg/3At4eaUt)

## One-Click Deployment Script

Use our quick deployment script to complete Jito Shredstream deployment in just a few simple steps.

### 📋 Prerequisites

1. ✅ Have obtained `shred_keypair.json` file
2. ✅ Server root privileges
3. ✅ Linux system

### 🎯 Quick Start

#### 1. Upload Key File
Run this command from your local machine:
```bash
scp shred_keypair.json root@your_server:/root/shred_keypair.json
```

#### 2. Clone Repository
Run these commands on your server:
```bash
sudo su -
cd /root
git clone https://github.com/0xfnzero/jito-shredstream-install.git
cd jito-shredstream-install
```

#### 3. Run Deployment Script
```bash
bash quick-deploy.sh
```

#### 4. Select Region
```
Please select deployment region:

  1. 🇺🇸 New York
  2. 🇩🇪 Frankfurt  
  3. 🇳🇱 Amsterdam
  4. 🇬🇧 London
  5. 🇺🇸 Salt Lake City
  6. 🇸🇬 Singapore
  7. 🇯🇵 Tokyo
  8. 🇮🇪 Dublin

Please enter region number (1-8): 
```

#### 5. Start Service
```bash
cd /root/shredstream-proxy
./startup-[region].sh    # Based on selected region
tail -f shredstream.log  # View logs
```

### 🎉 Complete!

The script will automatically complete the following operations:
- ✅ Check key file
- ✅ Create necessary directories
- ✅ Configure firewall rules
- ✅ Download binary files
- ✅ Copy regional startup scripts from this repository
- ✅ Set file permissions

### 📞 Support

- **Official Website**: https://fnzero.dev/
- **Telegram**: https://t.me/fnzero_group
- **Detailed Documentation**: [DEPLOYMENT_GUIDE.md](./DEPLOYMENT_GUIDE.md)
