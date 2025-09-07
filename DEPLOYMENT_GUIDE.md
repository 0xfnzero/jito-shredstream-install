# Jito Shredstream Detailed Deployment Guide

[中文](https://github.com/0xfnzero/jito-shredstream-install/blob/main/DEPLOYMENT_GUIDE_CN.md) | [English](https://github.com/0xfnzero/jito-shredstream-install/blob/main/DEPLOYMENT_GUIDE.md) | [Website](https://fnzero.dev/) | [Telegram](https://t.me/fnzero_group)

## Overview

This guide provides detailed manual deployment steps for Jito Shredstream, suitable for users who want to understand every deployment detail.

> **Want to deploy quickly?** Please check [Quick Deployment Guide](QUICK_START.md)

## Prerequisites

Before starting deployment, please ensure you have:

1. ✅ Obtained `shred_keypair.json` file
2. ✅ Server root privileges
3. ✅ Server running Ubuntu system
4. ✅ Normal network connection

## Detailed Deployment Steps

### 1. Upload Key File

Upload your `shred_keypair.json` file to the server's `/root` directory:

```bash
# Upload shred_keypair.json to server /root directory
scp shred_keypair.json root@your_server_ip:/root/shred_keypair.json
```

### 2. Configure Firewall

#### 2.1 Download Firewall Configuration Script

```bash
# Enter /root directory
cd /root

# Download port opening script
wget https://github.com/0xfnzero/jito-shredstream-install/releases/download/v1.1/ufw.sh

# Grant script executable permissions
chmod +x ufw.sh
```

#### 2.2 Execute Firewall Configuration

```bash
# Execute script
./ufw.sh
```

The firewall script will automatically configure the following rules:
- **Port Opening**: 20000/udp, 10800/tcp
- **IP Whitelist**: Jito server IP addresses for each region

### 3. Create Working Directory

```bash
# Enter root directory
cd /root

# Create shredstream-proxy directory
mkdir -p shredstream-proxy

# Enter working directory
cd shredstream-proxy
```

### 4. Download Binary Files

#### 4.1 Download jito-shredstream-proxy Binary File

```bash
# Download binary file
wget https://github.com/jito-labs/shredstream-proxy/releases/download/v0.2.8/jito-shredstream-proxy-x86_64-unknown-linux-gnu

# Rename
mv jito-shredstream-proxy-x86_64-unknown-linux-gnu jito-shredstream-proxy

# Grant file executable permissions
chmod +x jito-shredstream-proxy
```

### 5. Download Startup and Stop Scripts

Download the corresponding startup script based on your selected region:

#### 🇺🇸 New York
```bash
wget https://github.com/0xfnzero/jito-shredstream-install/releases/download/v1.1/startup-ny.sh
chmod +x startup-ny.sh
```

#### 🇩🇪 Frankfurt
```bash
wget https://github.com/0xfnzero/jito-shredstream-install/releases/download/v1.1/startup-fra.sh
chmod +x startup-fra.sh
```

#### 🇳🇱 Amsterdam
```bash
wget https://github.com/0xfnzero/jito-shredstream-install/releases/download/v1.1/startup-ams.sh
chmod +x startup-ams.sh
```

#### 🇬🇧 London
```bash
wget https://github.com/0xfnzero/jito-shredstream-install/releases/download/v1.1/startup-london.sh
chmod +x startup-london.sh
```

#### 🇺🇸 Salt Lake City
```bash
wget https://github.com/0xfnzero/jito-shredstream-install/releases/download/v1.1/startup-slc.sh
chmod +x startup-slc.sh
```

#### 🇸🇬 Singapore
```bash
wget https://github.com/0xfnzero/jito-shredstream-install/releases/download/v1.1/startup-singapore.sh
chmod +x startup-singapore.sh
```

#### 🇯🇵 Tokyo
```bash
wget https://github.com/0xfnzero/jito-shredstream-install/releases/download/v1.1/startup-tokyo.sh
chmod +x startup-tokyo.sh
```

#### 🇮🇪 Dublin
```bash
wget https://github.com/0xfnzero/jito-shredstream-install/releases/download/v1.1/startup-dublin.sh
chmod +x startup-dublin.sh
```

#### Download Stop Script

```bash
wget https://github.com/0xfnzero/jito-shredstream-install/releases/download/v1.1/stop.sh
chmod +x stop.sh
```

### 6. Start Service

```bash
# Start service (based on your downloaded script)
./startup-ny.sh      # New York
./startup-fra.sh     # Frankfurt
./startup-ams.sh     # Amsterdam
./startup-london.sh  # London
./startup-slc.sh     # Salt Lake City
./startup-singapore.sh # Singapore
./startup-tokyo.sh   # Tokyo
./startup-dublin.sh  # Dublin

# View logs
tail -f shredstream.log
```

## Regional Configuration Details

| Region | Script Name | Block Engine URL | Region Code |
|--------|-------------|------------------|-------------|
| 🇺🇸 New York | startup-ny.sh | https://ny.mainnet.block-engine.jito.wtf | ny |
| 🇩🇪 Frankfurt | startup-fra.sh | https://frankfurt.mainnet.block-engine.jito.wtf | frankfurt |
| 🇳🇱 Amsterdam | startup-ams.sh | https://amsterdam.mainnet.block-engine.jito.wtf | amsterdam |
| 🇬🇧 London | startup-london.sh | https://london.mainnet.block-engine.jito.wtf | london |
| 🇺🇸 Salt Lake City | startup-slc.sh | https://slc.mainnet.block-engine.jito.wtf | slc |
| 🇸🇬 Singapore | startup-singapore.sh | https://singapore.mainnet.block-engine.jito.wtf | singapore |
| 🇯🇵 Tokyo | startup-tokyo.sh | https://tokyo.mainnet.block-engine.jito.wtf | tokyo |
| 🇮🇪 Dublin | startup-dublin.sh | https://dublin.mainnet.block-engine.jito.wtf | dublin |

## Service Management

### Start Service
```bash
cd /root/shredstream-proxy
./startup-[region].sh
```

### View Logs
```bash
tail -f /root/shredstream-proxy/shredstream.log
```

### Stop Service
```bash
cd /root/shredstream-proxy
./stop.sh
```

### Check Service Status
```bash
# Check if process is running
ps aux | grep jito-shredstream-proxy

# Check PID file
cat /root/shredstream-proxy/shredstream.pid
```

## Troubleshooting

### Common Issues

1. **Permission Error**
   ```bash
   # Ensure running with root privileges
   sudo su -
   ```

2. **Key File Not Found**
   ```bash
   # Check if key file exists
   ls -la /root/shred_keypair.json
   ```

3. **Port Occupied**
   ```bash
   # Check port usage
   netstat -tulpn | grep :10800
   netstat -tulpn | grep :20000
   ```

4. **Service Startup Failed**
   ```bash
   # View detailed logs
   tail -f /root/shredstream-proxy/shredstream.log
   ```

### Log Analysis

Log file location: `/root/shredstream-proxy/shredstream.log`

Common log information:
- `Starting new jito-shredstream-proxy...` - Service starting
- `Started with PID` - Service started successfully
- Connection error information - Network or configuration issues

## File Structure

File structure after deployment completion:

```
/root/
├── shred_keypair.json          # Authentication key file
└── shredstream-proxy/
    ├── jito-shredstream-proxy  # Main program binary file
    ├── startup-[region].sh     # Regional startup script
    ├── stop.sh                 # Stop script
    ├── ufw.sh                  # Firewall configuration script
    ├── shredstream.log         # Runtime logs
    └── shredstream.pid         # Process ID file
```

## Updates and Maintenance

### Update Binary Files
```bash
cd /root/shredstream-proxy

# Stop service
./stop.sh

# Download new version
wget https://github.com/jito-labs/shredstream-proxy/releases/download/v[version]/jito-shredstream-proxy-x86_64-unknown-linux-gnu

# Replace old file
mv jito-shredstream-proxy-x86_64-unknown-linux-gnu jito-shredstream-proxy
chmod +x jito-shredstream-proxy

# Restart
./startup-[region].sh
```

### Clear Logs
```bash
# Clear log file
> /root/shredstream-proxy/shredstream.log
```

## Firewall Configuration Details

The firewall script will automatically configure the following IP whitelist:

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

## Support

- **Official Website**: https://fnzero.dev/
- **Telegram Group**: https://t.me/fnzero_group
- **GitHub Repository**: https://github.com/0xfnzero/jito-shredstream-install
- **Quick Deployment**: [QUICK_START_EN.md](QUICK_START_EN.md)

## Version Information

- **Shredstream Proxy Version**: v0.2.8
- **Installation Script Version**: v1.1
- **Last Updated**: September 2024

---

**Note**: This guide focuses on detailed manual deployment steps. If you want to deploy quickly, please use [Quick Deployment Guide](QUICK_START_EN.md).

