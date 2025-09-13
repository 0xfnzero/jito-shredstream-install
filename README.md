# jito-shredstream-install

[中文](https://github.com/0xfnzero/jito-shredstream-install/blob/main/README_CN.md) | [English](https://github.com/0xfnzero/jito-shredstream-install/blob/main/README.md) | [Website](https://fnzero.dev/) | [Telegram](https://t.me/fnzero_group) | [Discord](https://discord.gg/3At4eaUt)

## 🚀 Quick Deployment

**Want to deploy quickly?** Use our one-click deployment script:

👉 **[Quick Deployment Guide](QUICK_START.md)** - One-click deployment script with 8 region options

👉 **[Detailed Deployment Guide](DEPLOYMENT_GUIDE.md)** - Complete deployment documentation and troubleshooting

---

## 📋 Manual Deployment Steps

Before installing shredstream, you need to have a shredstream key to receive data properly

#### 1. Upload the obtained shred_keypair.json to the server /root directory
```shell
  # Upload file
  scp shred_keypair.json root@your_id:/root/shred_keypair.json
```

#### 2. Enable firewall ports required for shredstream
```shell
  # Enter /root directory
  cd /root

  # Download port opening script
  sudo wget https://github.com/0xfnzero/jito-shredstream-install/releases/download/v1.2/ufw.sh

  # Grant script executable permissions
  sudo chmod +x ufw.sh

  # Execute script
  sudo ./ufw.sh
```

#### 3. Create shredstream-proxy directory under /root
```shell
  # Enter root directory
  cd /root

  # Create directory
  sudo mkdir -p shredstream-proxy
```

#### 4. Download jito-shredstream-proxy binary file, no source code compilation needed
```shell
  # Enter directory
  cd /root/shredstream-proxy

  # Download binary file
  sudo wget https://github.com/jito-labs/shredstream-proxy/releases/download/v0.2.10/jito-shredstream-proxy-x86_64-unknown-linux-gnu

  # Rename
  sudo mv jito-shredstream-proxy-x86_64-unknown-linux-gnu jito-shredstream-proxy

  # Grant file executable permissions
  sudo chmod +x jito-shredstream-proxy
```

#### 5. Download shredstream startup and stop scripts:
```shell
  # Enter directory
  cd /root/shredstream-proxy

  # Download startup script, if it's amsterdam region, download startup-ams.sh
  sudo wget https://github.com/0xfnzero/jito-shredstream-install/releases/download/v1.2/startup-ny.sh

  # Download stop script
  sudo wget https://github.com/0xfnzero/jito-shredstream-install/releases/download/v1.2/stop.sh

  # Grant script executable permissions
  sudo chmod +x startup-ny.sh
  sudo chmod +x stop.sh
```

#### 6. Start service:
```shell
  # Enter directory
  cd /root/shredstream-proxy

  # Start script
  ./startup-ny.sh

  # View logs
  tail -f shredstream.log

  # Stop service
  ./stop.sh
```

## 📚 Related Documentation

- **[Quick Deployment Guide](QUICK_START.md)** - One-click deployment script usage instructions
- **[Detailed Deployment Guide](DEPLOYMENT_GUIDE.md)** - Complete deployment documentation and troubleshooting
- **[Quick Deployment Script](quick-deploy.sh)** - Automated deployment script

## 📞 Support

- **Official Website**: https://fnzero.dev/
- **Telegram Group**: https://t.me/fnzero_group

