# 🚀 Jito Shredstream Quick Deployment

[中文](https://github.com/0xfnzero/jito-shredstream-install/blob/main/QUICK_START_CN.md) | [English](https://github.com/0xfnzero/jito-shredstream-install/blob/main/QUICK_START.md) | [Website](https://fnzero.dev/) | [Telegram](https://t.me/fnzero_group)

## One-Click Deployment Script

Use our quick deployment script to complete Jito Shredstream deployment in just a few simple steps.

### 📋 Prerequisites

1. ✅ Have obtained `shred_keypair.json` file
2. ✅ Server root privileges
3. ✅ Linux system

### 🎯 Quick Start

#### 1. Download Deployment Script
```bash
wget https://github.com/0xfnzero/jito-shredstream-install/raw/main/quick-deploy.sh
chmod +x quick-deploy.sh
```

#### 2. Upload Key File
```bash
scp shred_keypair.json root@your_server:/root/shred_keypair.json
```

#### 3. Run Deployment Script
```bash
sudo ./quick-deploy.sh
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
- ✅ Download regional startup scripts
- ✅ Set file permissions

### 📞 Support

- **Official Website**: https://fnzero.dev/
- **Telegram**: https://t.me/fnzero_group
- **Detailed Documentation**: [DEPLOYMENT_GUIDE_EN.md](./DEPLOYMENT_GUIDE_EN.md)

