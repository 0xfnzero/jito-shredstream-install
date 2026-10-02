#!/bin/bash

set -e
export RUST_LOG=info

# Upstream v0.2.14 disables shredstream after this UTC timestamp.
# Check before stopping an existing process or clearing its log.
if [ "$(date +%s)" -ge 1788566400 ]; then
    echo "Jito ShredStream shut down on September 5, 2026." >&2
    echo "Migrate to DoubleZero Edge: https://doublezero.xyz/jito-shredstream" >&2
    exit 1
fi

# 配置
PID_FILE="shredstream.pid"
LOG_FILE="shredstream.log"
rm -f "$LOG_FILE"

# 检查并停止旧进程
if [ -f "$PID_FILE" ]; then
    OLD_PID=$(cat "$PID_FILE")
    if ps -p "$OLD_PID" > /dev/null 2>&1; then
        echo "Found running process with PID $OLD_PID. Stopping..."
        kill "$OLD_PID"
        sleep 1
        if ps -p "$OLD_PID" > /dev/null 2>&1; then
            echo "Process $OLD_PID did not exit, force killing..."
            kill -9 "$OLD_PID"
        fi
        echo "Stopped previous process."
    else
        echo "Found stale PID file. Removing..."
    fi
    rm -f "$PID_FILE"
fi

# 启动新进程
echo "Starting new jito-shredstream-proxy..."
    
nohup /root/shredstream-proxy/jito-shredstream-proxy shredstream \
    --block-engine-url https://frankfurt.mainnet.block-engine.jito.wtf \
    --desired-regions frankfurt \
    --auth-keypair /root/shred_keypair.json \
    --dest-ip-ports 127.0.0.1:8001 \
    --grpc-service-port 10800 \
    > "$LOG_FILE" 2>&1 &

NEW_PID=$!
echo "$NEW_PID" > "$PID_FILE"
echo "Started with PID $NEW_PID. Logs at $(pwd)/$LOG_FILE"
