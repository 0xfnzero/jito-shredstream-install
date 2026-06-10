# jito-shredstream-install

[中文](https://github.com/0xfnzero/jito-shredstream-install/blob/main/README_CN.md) | [English](https://github.com/0xfnzero/jito-shredstream-install/blob/main/README.md) | [Website](https://fnzero.dev/) | [Telegram](https://t.me/fnzero_group) | [Discord](https://discord.gg/vuazbGkqQE)

## 🚀 Quick Deployment

**Recommended installation: clone the full repository on the server, then run the deployment script.**

```bash
# Switch to root user
sudo su -

# Clone repository to /root
cd /root
git clone https://github.com/0xfnzero/jito-shredstream-install.git
cd jito-shredstream-install

# The script uses the shred_keypair.json included in this repository.
# To use your own key, replace ./shred_keypair.json before running.
bash quick-deploy.sh

# Start the selected region service after deployment
cd /root/shredstream-proxy
./startup-[region].sh
tail -f shredstream.log
```

👉 **[Quick Deployment Guide](QUICK_START.md)** - Repository-based deployment script with 8 region options

👉 **[Detailed Deployment Guide](DEPLOYMENT_GUIDE.md)** - Complete deployment documentation and troubleshooting

---

## 📋 Manual Deployment Steps

Before installing shredstream, you need a valid `shred_keypair.json` to receive data properly. This repository includes one by default. If you want to use your own key, replace `shred_keypair.json` in the repository or place it at `/root/shred_keypair.json`.

#### 1. Clone this repository to the server
```shell
  # Enter root directory
  cd /root

  # Clone repository
  git clone https://github.com/0xfnzero/jito-shredstream-install.git
  cd jito-shredstream-install
```

#### 2. Run the one-click deployment script
```shell
  # The script configures firewall rules, downloads the proxy binary,
  # copies the key file, and copies startup/stop scripts from this repository.
  sudo bash quick-deploy.sh
```

#### 3. Start service
```shell
  # Enter directory
  cd /root/shredstream-proxy

  # Start script, replace startup-ny.sh with your selected region script
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
