#!/bin/bash

set -e

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

SHREDSTREAM_PROXY_VERSION="${SHREDSTREAM_PROXY_VERSION:-v0.2.13}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 区域配置
declare -A REGIONS=(
    ["1"]="ny:New York:startup-ny.sh"
    ["2"]="fra:Frankfurt:startup-fra.sh"
    ["3"]="ams:Amsterdam:startup-ams.sh"
    ["4"]="london:London:startup-london.sh"
    ["5"]="slc:Salt Lake City:startup-slc.sh"
    ["6"]="singapore:Singapore:startup-singapore.sh"
    ["7"]="tokyo:Tokyo:startup-tokyo.sh"
    ["8"]="dublin:Dublin:startup-dublin.sh"
)

# 显示欢迎信息
echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}    Jito Shredstream 快速部署脚本${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""

# 检查是否以root权限运行
if [ "$EUID" -ne 0 ]; then
    echo -e "${RED}错误: 请以root权限运行此脚本${NC}"
    echo "使用方法: sudo ./quick-deploy.sh"
    exit 1
fi

# 显示区域选择菜单
echo -e "${YELLOW}请选择部署区域:${NC}"
echo ""
for i in {1..8}; do
    IFS=':' read -r region_code region_name script_name <<< "${REGIONS[$i]}"
    case $i in
        1) echo -e "  ${i}. 🇺🇸 ${region_name}" ;;
        2) echo -e "  ${i}. 🇩🇪 ${region_name}" ;;
        3) echo -e "  ${i}. 🇳🇱 ${region_name}" ;;
        4) echo -e "  ${i}. 🇬🇧 ${region_name}" ;;
        5) echo -e "  ${i}. 🇺🇸 ${region_name}" ;;
        6) echo -e "  ${i}. 🇸🇬 ${region_name}" ;;
        7) echo -e "  ${i}. 🇯🇵 ${region_name}" ;;
        8) echo -e "  ${i}. 🇮🇪 ${region_name}" ;;
    esac
done
echo ""

# 获取用户选择
while true; do
    read -p "请输入区域编号 (1-8): " choice
    if [[ "$choice" =~ ^[1-8]$ ]]; then
        break
    else
        echo -e "${RED}无效选择，请输入1-8之间的数字${NC}"
    fi
done

# 解析选择的区域
IFS=':' read -r region_code region_name script_name <<< "${REGIONS[$choice]}"

echo ""
echo -e "${GREEN}已选择区域: ${region_name}${NC}"
echo ""

# 检查shred_keypair.json文件是否存在
echo -e "${YELLOW}检查shred_keypair.json文件...${NC}"
if [ ! -f "/root/shred_keypair.json" ]; then
    echo -e "${RED}错误: 未找到 /root/shred_keypair.json 文件${NC}"
    echo -e "${YELLOW}请先将 shred_keypair.json 上传到服务器的 /root 目录下${NC}"
    echo "使用方法: scp shred_keypair.json root@your_server:/root/shred_keypair.json"
    exit 1
fi
echo -e "${GREEN}✓ shred_keypair.json 文件存在${NC}"

# 检查本地安装脚本是否存在
echo -e "${YELLOW}检查本地安装脚本...${NC}"
for required_file in ufw.sh stop.sh "${script_name}"; do
    if [ ! -f "${SCRIPT_DIR}/${required_file}" ]; then
        echo -e "${RED}错误: 未找到 ${SCRIPT_DIR}/${required_file}${NC}"
        echo -e "${YELLOW}请先下载完整仓库代码，再在仓库目录中执行 quick-deploy.sh${NC}"
        exit 1
    fi
done
echo -e "${GREEN}✓ 本地安装脚本完整${NC}"

# 进入/root目录
cd /root

# 创建shredstream-proxy目录
echo -e "${YELLOW}创建shredstream-proxy目录...${NC}"
mkdir -p shredstream-proxy
echo -e "${GREEN}✓ 目录创建完成${NC}"

# 进入shredstream-proxy目录
cd shredstream-proxy

# 复制防火墙配置脚本
echo -e "${YELLOW}复制防火墙配置脚本...${NC}"
cp "${SCRIPT_DIR}/ufw.sh" ./ufw.sh
chmod +x ufw.sh
echo -e "${GREEN}✓ 防火墙脚本复制完成${NC}"

# 执行防火墙配置
echo -e "${YELLOW}配置防火墙规则...${NC}"
./ufw.sh
echo -e "${GREEN}✓ 防火墙配置完成${NC}"

# 下载jito-shredstream-proxy二进制文件
echo -e "${YELLOW}下载jito-shredstream-proxy二进制文件...${NC}"
wget -q https://github.com/jito-labs/shredstream-proxy/releases/download/${SHREDSTREAM_PROXY_VERSION}/jito-shredstream-proxy-x86_64-unknown-linux-gnu
mv jito-shredstream-proxy-x86_64-unknown-linux-gnu jito-shredstream-proxy
chmod +x jito-shredstream-proxy
echo -e "${GREEN}✓ 二进制文件下载完成${NC}"

# 复制启动脚本
echo -e "${YELLOW}复制${region_name}启动脚本...${NC}"
cp "${SCRIPT_DIR}/${script_name}" "./${script_name}"
chmod +x ${script_name}
echo -e "${GREEN}✓ 启动脚本复制完成${NC}"

# 复制停止脚本
echo -e "${YELLOW}复制停止脚本...${NC}"
cp "${SCRIPT_DIR}/stop.sh" ./stop.sh
chmod +x stop.sh
echo -e "${GREEN}✓ 停止脚本复制完成${NC}"

echo ""
echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}    部署完成！${NC}"
echo -e "${GREEN}========================================${NC}"
echo ""
echo -e "${YELLOW}使用方法:${NC}"
echo -e "  启动服务: ${BLUE}./${script_name}${NC}"
echo -e "  查看日志: ${BLUE}tail -f shredstream.log${NC}"
echo -e "  停止服务: ${BLUE}./stop.sh${NC}"
echo ""
echo -e "${YELLOW}文件位置:${NC}"
echo -e "  工作目录: ${BLUE}/root/shredstream-proxy${NC}"
echo -e "  日志文件: ${BLUE}/root/shredstream-proxy/shredstream.log${NC}"
echo -e "  PID文件:  ${BLUE}/root/shredstream-proxy/shredstream.pid${NC}"
echo ""
echo -e "${GREEN}现在可以运行 ./${script_name} 启动服务${NC}"
